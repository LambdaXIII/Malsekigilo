#include "numbermetercore.h"
#include <QRandomGenerator>
#include <QQmlApplicationEngine>

NumberMeterCore::NumberMeterCore(QObject *parent) : QObject(parent)
{
  QList<Direction> directs = {N, S, W, E};
  while (m_directionMap.count() <= 10) {
    int x = QRandomGenerator::global()->bounded(3);
    m_directionMap.append(directs[x]);
  }
  m_currentValue = 0;
}

void NumberMeterCore::registerToEngine()
{
  qmlRegisterType<NumberMeterCore>("Malsekigilo.Core", 1, 0, "NumberMeterCore");
}

int NumberMeterCore::getFromX(int x) const
{
  auto direction = m_directionMap[x];
  int result;
  switch (direction) {
    case W:
      result = 0 - m_parentWidth;
      break;
    case E:
      result = m_parentWidth;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

int NumberMeterCore::getFromY(int x) const
{
  auto direction = m_directionMap[x];
  int result;
  switch (direction) {
    case N:
      result = 0 - m_parentHeight;
      break;
    case S:
      result = m_parentHeight;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}


int NumberMeterCore::getToX(int x) const
{
  auto direction = m_directionMap[x];
  int result;
  switch (direction) {
    case W:
      result =  m_parentWidth;
      break;
    case E:
      result = 0 - m_parentWidth;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

int NumberMeterCore::getToY(int x) const
{
  auto direction = m_directionMap[x];
  int result;
  switch (direction) {
    case N:
      result = m_parentHeight;
      break;
    case S:
      result = 0 - m_parentHeight;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}


int NumberMeterCore::fromX() const
{
  return getFromX(m_currentValue);
}
int NumberMeterCore::fromY() const
{
  return getFromY(m_currentValue);
}
int NumberMeterCore::toX() const
{
  return getToX(m_currentValue);
}
int NumberMeterCore::toY() const
{
  return getToY(m_currentValue);
}

QString NumberMeterCore::currentNumberPic() const
{
  auto temp = QString("assets/pics/Num%1.png");
  return temp.arg(m_currentValue);
}
