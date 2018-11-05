#include "machinecore.h"
#include <QQmlApplicationEngine>
#include "candyhandy.h"
#include <QtDebug>
#include <QMutexLocker>

MachineCore::MachineCore(QObject *parent) : QObject(parent)
{
  m_mainTimer = new QTimer(this);
  m_wetPercent = 50;

//  connect(m_mainTimer, &QTimer::timeout, this, &MachineCore::wetDecrease);
//  connect(m_mainTimer, &QTimer::timeout, this, &MachineCore::wetIncrease);
  connect(m_mainTimer, &QTimer::timeout, this, &MachineCore::tick);
}

MachineCore::~MachineCore()
{
  if (m_mainTimer->isActive())
    m_mainTimer->stop();
  m_mainTimer->deleteLater();
}

void MachineCore::startTimer()
{
  m_mainTimer->start(m_tickTime);
  qDebug() << "MachineCore timer started.";
}


void MachineCore::registerToEngine()
{
  auto provider = [](QQmlEngine * engine, QJSEngine * scriptEngine) -> QObject * {
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    MachineCore *single = new MachineCore();
    return single;
  };

  qmlRegisterSingletonType<MachineCore>("Malsekigilo.Core", 1, 0, "MachineCore", provider);
//  qmlRegisterType<MachineCore::Level>("Malsekigilo.Core", 1, 0, "Level");
}

QMap<MachineCore::Level, qreal> MachineCore::m_increaseMap = {
  {MachineCore::Off, 0},
  {MachineCore::Low, 0.1},
  {MachineCore::Medium, 0.15},
  {MachineCore::High, 0.25}
};

QMap<MachineCore::Level, qreal> MachineCore::m_increaseDelta = {
  {MachineCore::Off, 0},
  {MachineCore::Low, 0.05},
  {MachineCore::Medium, 0.07},
  {MachineCore::High, 0.14}
};

int MachineCore::m_tickTime = 1000;

qreal MachineCore::m_decreasePerTick = 0.075;
qreal MachineCore::m_decreaseDelta = 0.075;

qreal MachineCore::wetPercent() const
{
  return m_wetPercent;
}

QString MachineCore::wetPercentText() const
{
  return QString("%1%").arg(m_wetPercent, 0, 'f', 2);
}

void MachineCore::setWetPercent(qreal x)
{
  QMutexLocker locker(&m_wetPercentMutex);

  qreal filteredX = candy::positiveGate(x);
  if (! candy::compareQReal(filteredX, m_wetPercent)) {
    m_wetPercent = x;
    emit wetPercentChanged(x);
    auto wet_t = QString("%1%").arg(x, 0, 'f', 2);
    emit wetPercentTextChanged(wet_t);
  }
}

void MachineCore::wetDecrease()
{
  qreal current = m_wetPercent;
  qreal delta = candy::flowNumber(m_decreasePerTick, m_decreaseDelta);
  setWetPercent(current - delta);
//  qDebug() << "decreased.";
}

void MachineCore::wetIncrease()
{
  qreal c = candy::flowNumber(m_increaseMap[m_flowLevel], m_increaseDelta[m_flowLevel]);
  qreal current = m_wetPercent;
  setWetPercent(current + c);
//  qDebug() << "increased.";
}

void MachineCore::tick()
{
  /*
   qreal old_value = m_wetPercent;
   qreal new_value = candy::positiveGate(old_value + m_increaseMap[m_flowLevel] - m_decreasePerTick);
   if(! candy::compareQReal(old_value, new_value)){

     }
     */
  wetDecrease();
  wetIncrease();
  qDebug() << m_wetPercent << m_flowLevel ;
}


