#ifndef __RANDOM_H__
#define __RANDOM_H__

#include <QObject>
#include <QString>
#include <QStringList>
#include <QFile>
#include <QTextStream>
#include <QDateTime>
#include <QDebug>
#include <QDir>
#include <cstdlib>
#include <ctime>

class Lottery : public QObject
{
    Q_OBJECT

public:
    Lottery() {
        srand(time(NULL));
        if (QFile::exists("range.txt")) {
            QFile rangeFile("range.txt");
            if (rangeFile.open(QIODevice::ReadOnly | QIODevice::Text)) {
                QTextStream in(&rangeFile);
                QString trash;
                in >> trash >> mStart;
                in >> trash >> mStop;
                rangeFile.close();
            }
        }
        if (!QDir("prizes").exists()) {
            QDir().mkdir("prizes");
        }
    }

public:
    QString getRandom() {
        QString prize;
        do {
            prize = QString::number(rand() % (mStop - mStart) + mStart);
        } while(isDuplicated(prize));
        return prize;
    }

    Q_INVOKABLE QStringList getLuckyPrizes(bool accepted = false) {
        QStringList results;
        for(int i = 0; i < 10; i++) {
            QString prize;
            do {
                prize = getRandom();
            } while (results.contains(prize));
            results << prize;
        }
        if (accepted) {
            mLuckPrizes = results;
            QFile file("prizes/lucky_prize.txt");
            if (file.open(QIODevice::WriteOnly | QIODevice::Append | QIODevice::Text)) {
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
            QFile file("prizes/first_prize.txt");
            if (file.open(QIODevice::WriteOnly | QIODevice::Append | QIODevice::Text)) {
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
            QFile file("prizes/patch_prize.txt");
            if (file.open(QIODevice::WriteOnly | QIODevice::Append | QIODevice::Text)) {
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
            QString prize;
            do {
                prize = getRandom();
            } while (results.contains(prize));
            results << prize;
        }
        if (accepted) {
            mLuckPrizes = results;
            QFile file("prizes/second_prize.txt");
            if (file.open(QIODevice::WriteOnly | QIODevice::Append | QIODevice::Text)) {
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
            QString prize;
            do {
                prize = getRandom();
            } while (results.contains(prize));
            results << prize;
        }
        if (accepted) {
            mLuckPrizes = results;
            QFile file("prizes/third_prize.txt");
            if (file.open(QIODevice::WriteOnly | QIODevice::Append | QIODevice::Text)) {
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
    int mStart = 1, mStop = 501;
};

#endif // __RANDOM_H__
