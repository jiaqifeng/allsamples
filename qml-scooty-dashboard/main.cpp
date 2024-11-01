#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setApplicationVersion("1.0.0");
    QCoreApplication::setApplicationName("Eagle Theme");
    QCoreApplication::setOrganizationName("TechCoderHub");
#endif
    qputenv("QT_QUICK_CONTROLS_STYLE", QByteArray("Basic"));
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/app.ico"));// need include QIcon

    QQmlApplicationEngine engine;

    qmlRegisterSingletonType(QStringLiteral("qrc:/StyleTheme.qml"),"Style",1,0,"Style");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
