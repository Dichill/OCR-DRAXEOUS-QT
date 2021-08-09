# This Python file uses the following encoding: utf-8
import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QUrl, QTimer
import pytesseract

pytesseract.pytesseract.tesseract_cmd = r'plugins/Tesseract-OCR/Tesseract.exe'
snip_storage = "snip/"

class MainWindow(QObject):
	def __init__(self):
		QObject.__init__(self)

		self.timer = QTimer()
		self.timer.timeout.connect(lambda:self.checkSnip())
		self.timer.start(1000)

	# Globals
	sourceTar = Signal(str) # URL PATH

	outputText = Signal(str)


	def checkSnip(self):
		print("[DrX] Checking for Snipped Image")
		if os.path.exists(snip_storage + "recent.png"):
			self.startProcess(snip_storage + "recent.png")
			print("[DrX] Found Snipped Image")


	@Slot(str)
	def startProcess(self, imagepath):
		try:
			img_to_text = pytesseract.image_to_string(imagepath)
			print("[DrX] Output: " + img_to_text)
			self.outputText.emit(str(img_to_text))
			if os.path.exists(snip_storage + "recent.png"):
				os.remove(snip_storage + "recent.png")				
		except Exception as e:
			print("[DrX] An Error has Occured! " + str(e))

	@Slot(str)
	def getPath(self, sourcepath):
		print("[System] " + str(sourcepath))
		ImagePath = str(sourcepath)
		self.sourceTar.emit(str(sourcepath))
		self.startProcess(QUrl(sourcepath).toLocalFile())

	# setName = Signal(str) | Example

	# Slots

	#@Slot(str)


	#def welcomeText(self, name): | Example
	#	self.setName.emit("Welcome, " + name) | Example

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Get Context
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)

    app.setOrganizationName("Dichill")
    app.setOrganizationDomain("N/A")

    # Load QML File
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
