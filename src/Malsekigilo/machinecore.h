#ifndef MACHINECORE_H
#define MACHINECORE_H

#include <QObject>
#include "candy_macros.h"
#include <QTimer>
#include <QBasicMutex>

class MachineCore : public QObject
{
  Q_OBJECT
public:
  enum Level {
    Off, Low, Medium, High
  };
  Q_ENUM(Level)

protected:

  CANDY_PROPERTY_VALUE(bool, isActivated, IsActivated, false)

  Q_PROPERTY(bool isActivated READ isActivated WRITE setIsActivated NOTIFY isActivatedChanged)

  CANDY_PROPERTY_VALUE(MachineCore::Level, flowLevel, FlowLevel, Off)

  Q_PROPERTY(MachineCore::Level flowLevel READ flowLevel WRITE setFlowLevel NOTIFY flowLevelChanged)

  Q_PROPERTY(qreal wetPercent READ wetPercent WRITE setWetPercent NOTIFY wetPercentChanged)

  Q_PROPERTY(QString wetPercentText READ wetPercentText NOTIFY wetPercentTextChanged)


public:
  explicit MachineCore(QObject *parent = nullptr);
  ~MachineCore();
  static void registerToEngine();

  qreal wetPercent() const;
  void setWetPercent(qreal x);

  QString wetPercentText() const;

protected:
  QTimer *m_mainTimer;

  qreal m_wetPercent;
  QMutex m_wetPercentMutex;

  static QMap<MachineCore::Level, qreal> m_increaseMap;
  static QMap<MachineCore::Level, qreal> m_increaseDelta;
  static int m_tickTime;
  static qreal m_decreasePerTick;
  static qreal m_decreaseDelta;


signals:
  void isActivatedChanged(bool x);
  void flowLevelChanged(Level l);
  void wetPercentChanged(qreal x);
  void wetPercentTextChanged(QString x);

public slots:
  void startTimer();

protected slots:
  void wetDecrease();
  void wetIncrease();
  void tick();
};

#endif // MACHINECORE_H
