#ifndef __RANDOM_H__
#define __RANDOM_H__

#include <QObject>
#include <QString>
#include <QStringList>
#include <QFile>
#include <QTextStream>
#include <QDateTime>
#include <cstdlib>
#include <ctime>

class Lottery : public QObject
{
    Q_OBJECT

public:
    Lottery() {
        srand(time(NULL));
    }

public:
    QString getRandom() {
        QString prize;
        do {
            prize = QString::number(rand() % 500 + 1);
        } while(isDuplicated(prize));
        return prize;
    }

    Q_INVOKABLE QStringList getLuckyPrizes(bool accepted = false) {
        QStringList results;
        for(int i = 0; i < 10; i++) {
            results << getRandom();
        }
        if (accepted) {
            mLuckPrizes = results;
            QFile file("lucky_prize.txt");
            if (file.open(QIODevice::WriteOnly | QIODevice::Append)) {
                QTextStream out(&file);
                out << QDateTime::currentDateTime().toString("yyyy/MM/dd hh:mm:ss >>> ");
                for(int i = 0; i < 10; i++) {
                    out << results.at(i) << " ";
                }
                out << endl;
                file.close();
            }
        }
        return results;
    }

    Q_INVOKABLE QString getFirstPrize(bool accepted = false) {
        QString prize = getRandom();
        if (accepted) {
            mFirstPrize = prize;
            QFile file("first_prize.txt");
            if (file.open(QIODevice::WriteOnly | QIODevice::Append)) {
                QTextStream out(&file);
                out << QDateTime::currentDateTime().toString("yyyy/MM/dd hh:mm:ss >>> ") << prize << endl;
                file.close();
            }
        }
        return prize;
    }

    Q_INVOKABLE QString getPatchPrize(bool accepted = false) {
        QString prize = getRandom();
        if (accepted) {
            mPatchPrizes.append(prize);
            QFile file("patch_prize.txt");
            if (file.open(QIODevice::WriteOnly | QIODevice::Append)) {
                QTextStream out(&file);
                out << QDateTime::currentDateTime().toString("yyyy/MM/dd hh:mm:ss >>> ") << prize << endl;
                file.close();
            }
        }
        return prize;
    }

    Q_INVOKABLE QStringList getSecondPrizes(bool accepted = false) {
        QStringList results;
        for(int i = 0; i < 2; i++) {
            results << getRandom();
        }
        if (accepted) {
            mLuckPrizes = results;
            QFile file("second_prize.txt");
            if (file.open(QIODevice::WriteOnly | QIODevice::Append)) {
                QTextStream out(&file);
                out << QDateTime::currentDateTime().toString("yyyy/MM/dd hh:mm:ss >>> ");
                for(int i = 0; i < 2; i++) {
                    out << results.at(i) << " ";
                }
                out << endl;
                file.close();
            }
        }
        return results;
    }

    Q_INVOKABLE QStringList getThirdPrizes(bool accepted = false) {
        QStringList results;
        for(int i = 0; i < 3; i++) {
            results << getRandom();
        }
        if (accepted) {
            mLuckPrizes = results;
            QFile file("third_prize.txt");
            if (file.open(QIODevice::WriteOnly | QIODevice::Append)) {
                QTextStream out(&file);
                out << QDateTime::currentDateTime().toString("yyyy/MM/dd hh:mm:ss >>> ");
                for(int i = 0; i < 3; i++) {
                    out << results.at(i) << " ";
                }
                out << endl;
                file.close();
            }
        }
        return results;
    }

private:
    bool isDuplicated(QString prize) {
        return mLuckPrizes.contains(prize) || mFirstPrize == prize ||
               mSecondPrize.contains(prize) || mThirdPrize.contains(prize) || mPatchPrizes.contains(prize);
    }

private:
    QStringList mLuckPrizes;
    QString mFirstPrize;
    QStringList mSecondPrize;
    QStringList mThirdPrize;
    QStringList mPatchPrizes;
};

#endif // __RANDOM_H__
