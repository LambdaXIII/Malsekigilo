#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "machinecore.h"
#include "numbermetercore.h"

int main(int argc, char *argv[])
{
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);
  app.setApplicationDisplayName(app.tr("桌面加湿器"));
  app.setApplicationName("Malsekigilo");
  app.setApplicationVersion("0.1-alpha");

  MachineCore::registerToEngine();
  NumberMeterCore::registerToEngine();

  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty())
    return -1;

  return app.exec();
}
