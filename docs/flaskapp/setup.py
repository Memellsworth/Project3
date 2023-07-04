import tkinter as tk
import os
import subprocess
import webbrowser


def start_flask():
    webbrowser.open('http://127.0.0.1:5000/')

root = tk.Tk()
root.title("Flight Delay Explorer App")

label = tk.Label(root, text="prior to accessing the dashboard, please run this setup first")
label.pack()

photo = tk.PhotoImage(file="guilogo.gif")
photo = photo.subsample(4,4)
image_label = tk.Label(root, image=photo)
image_label.pack()

button = tk.Button(root, text='Run Setup', command=start_flask)
button.pack()

root.mainloop()
