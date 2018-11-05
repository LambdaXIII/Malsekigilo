#ifndef CANDYHANDY_H
#define CANDYHANDY_H

#include <QObject>

namespace candy {

bool compareQReal(qreal x, qreal y);

qreal positiveGate(qreal x);

qreal flowNumber(qreal origin, qreal delta);
};

#endif // CANDYHANDY_H
