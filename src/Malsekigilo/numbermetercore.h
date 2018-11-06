#ifndef NUMBERMETERCORE_H
#define NUMBERMETERCORE_H

#include <QObject>
#include <candy_macros.h>

/**
 * @brief The NumberMeterCore class
 * NumberMeter's core calculator.
 */
class NumberMeterCore : public QObject
{
  Q_OBJECT

  CANDY_PROPERTY(int, parentWidth, ParentWidth)
  Q_PROPERTY(int parentWidth READ parentWidth WRITE setParentWidth NOTIFY parentWidthChanged)

  CANDY_PROPERTY(int, parentHeight, ParentHeight)
  Q_PROPERTY(int parentHeight READ parentHeight WRITE setParentHeight NOTIFY parentHeightChanged)

  CANDY_PROPERTY_VALUE(int, currentValue, CurrentValue, 0)
  Q_PROPERTY(int currentValue READ currentValue WRITE setCurrentValue NOTIFY currentValueChanged)

  Q_PROPERTY(int fromX READ fromX)
  Q_PROPERTY(int fromY READ fromY)
  Q_PROPERTY(int toX READ toX)
  Q_PROPERTY(int toY READ toY)

  Q_PROPERTY(QString currentNumbetPic READ currentNumberPic)

public:
  enum Direction {
    N, S, W, E
  };
  Q_ENUMS(Direction)

  explicit NumberMeterCore(QObject *parent = nullptr);
  static void registerToEngine();

  int getFromX(int x) const;
  int getFromY(int x) const;
  int getToX(int x) const;
  int getToY(int x) const;

  int fromX() const;
  int fromY() const;
  int toX() const;
  int toY() const;

  QString currentNumberPic() const;

protected:
  QList<Direction> m_directionMap;

signals:
  void parentWidthChanged(int x);
  void parentHeightChanged(int x);
  void currentValueChanged(int x);

public slots:
};

#endif // NUMBERMETERCORE_H
