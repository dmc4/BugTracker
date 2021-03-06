#ifndef VIEWBUG_H
#define VIEWBUG_H

#include <QMainWindow>

#include "user.h"
#include "bug.h"



namespace Ui {
class ViewBug;
}

class ViewBug : public QMainWindow
{
    Q_OBJECT

public:
    explicit ViewBug(QWidget *parent = 0);
    ViewBug(QWidget *parent, Bug *b, User *u);
    ~ViewBug();
    void setBug();

private slots:
    void on_viewBug_ViewMoreButton_toggled(bool checked);

    void on_viewBug_addToCCListButton_clicked();

    void on_viewBug_clearCCListButton_clicked();

    void on_viewBug_addCommentButton_clicked();

private:
    Ui::ViewBug *ui;
    Bug *bug;
    User *user;
    void checkRole();


};

#endif // VIEWBUG_H
