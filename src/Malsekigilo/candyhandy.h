#ifndef CANDYHANDY_H
#define CANDYHANDY_H

#include <QObject>
#include <functional>

namespace candy {

bool compareQReal(qreal x, qreal y);

qreal positiveGate(qreal x);

qreal flowNumber(qreal origin, qreal delta);

template <typename N>
std::function<N(N)> createNumberGate(N min, N max)
{
  auto f = [ = ](N n)->N{
    if (n - min < 0)
      return min;
    if (n - max > 0)
      return max;
    return n;
  };
  return f;
}
};

#endif // CANDYHANDY_H
