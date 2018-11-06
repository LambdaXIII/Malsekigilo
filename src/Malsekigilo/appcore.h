#ifndef APPCORE_H
#define APPCORE_H

#include <QObject>
#include "candy_macros.h"

class AppCore : public QObject
{
  Q_OBJECT

  CANDY_PROPERTY_RO_VALUE(bool, cheatMode, false)
  Q_PROPERTY(bool cheatMode READ cheatMode NOTIFY cheatModeChanged)
public:
  explicit AppCore(QObject *parent = nullptr);

  bool enableCheatMode(QString &code);
  void disableCheatMode();

  static void registerToEngine();
private:
  static QString m_cheatCode;

signals:
  void cheatModeChanged(bool x);
public slots:
};

#endif // APPCORE_H
