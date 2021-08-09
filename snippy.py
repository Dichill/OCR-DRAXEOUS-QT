# https://github.com/harupy/snipping-tool
#
#   Big credits for Harupy for giving me knowledge about PIl, PyQt5, PIL, and CV2
#

import sys
from PyQt5 import QtWidgets, QtCore, QtGui
import tkinter as tk
from PIL import ImageGrab
import numpy as np
import cv2
import subprocess

class MyWidget(QtWidgets.QWidget):
    def __init__(self):
        super().__init__()
        root = tk.Tk()
        screen_width = root.winfo_screenwidth()
        screen_height = root.winfo_screenheight()
        self.setGeometry(0, 0, screen_width, screen_height)
        self.setWindowTitle('Draxeous AI - Snipping Tool')
        self.begin = QtCore.QPoint()
        self.end = QtCore.QPoint()
        self.setWindowOpacity(0.3)
        QtWidgets.QApplication.setOverrideCursor(
            QtGui.QCursor(QtCore.Qt.CrossCursor)
        )
        self.setWindowFlags(QtCore.Qt.FramelessWindowHint)
        print('[DrX] Process has started for Snipping Tool')
        self.show()

    def paintEvent(self, event):
        qp = QtGui.QPainter(self)
        qp.setPen(QtGui.QPen(QtGui.QColor('black'), 2))
        qp.setBrush(QtGui.QColor(48,209,88))
        qp.drawRect(QtCore.QRect(self.begin, self.end))

    def mousePressEvent(self, event):
        self.begin = event.pos()
        self.end = self.begin
        self.update()

    def mouseMoveEvent(self, event):
        self.end = event.pos()
        self.update()

    def mouseReleaseEvent(self, event):
        self.close()

        x1 = min(self.begin.x(), self.end.x())
        y1 = min(self.begin.y(), self.end.y())
        x2 = max(self.begin.x(), self.end.x())
        y2 = max(self.begin.y(), self.end.y())

        img = ImageGrab.grab(bbox=(x1, y1, x2, y2))
        img.save('snip/recent.png')
        img = cv2.cvtColor(np.array(img), cv2.COLOR_BGR2RGB)

        print("[DrX] Calling Draxeous AI")

        try:
            subprocess.Popen(["Draxeous AI.exe"])
        except:
            print("[DrX] an error has occured!")


if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    window = MyWidget()
    window.show()
    app.aboutToQuit.connect(app.deleteLater)
    sys.exit(app.exec_())