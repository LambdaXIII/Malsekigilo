#include "candyhandy.h"
#include <QRandomGenerator>

namespace candy {

bool compareQReal(qreal x, qreal y)
{
#define EPSILON 0.00000001
  return (qAbs(y - x) < EPSILON);
#undef EPSILON
}

qreal positiveGate(qreal x)
{
  if (x <= 0)
    return 0;
  return x;
}

qreal flowNumber(qreal origin, qreal delta)
{
  qreal aspect = QRandomGenerator::global()->bounded(200) - 100;
  qreal d = delta * aspect / 100.0;
  return origin - d;
}

}
