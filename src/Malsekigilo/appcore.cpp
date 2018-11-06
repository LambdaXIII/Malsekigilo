#include "appcore.h"
#include <QQmlApplicationEngine>

AppCore::AppCore(QObject *parent) : QObject(parent)
{

}

void AppCore::registerToEngine()
{
  auto provider = [](QQmlEngine * engine, QJSEngine * scriptEngine) -> QObject * {
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    AppCore *single = new AppCore();
    return single;
  };
  qmlRegisterSingletonType<AppCore>("Malsekigilo.Core", 1, 0, "AppCore", provider);
}


QString AppCore::m_cheatCode = "nocowlevel";


bool AppCore::enableCheatMode(QString & code)
{
  if (code == m_cheatCode) {
    if (! m_cheatMode) {
      m_cheatMode = true;
      emit cheatModeChanged(true);
    }
    return true;
  }
  return false;
}

void AppCore::disableCheatMode()
{
  m_cheatMode = false;
}
