import tkinter as tk
import os
import subprocess
import webbrowser
import platform

def start_flask():
    webbrowser.open('http://127.0.0.1:5000/setup')


root = tk.Tk()
root.title("Flight Delay Explorer App")

# Set the window sizen
window_width = 600
window_height = 600
root.geometry(f"{window_width}x{window_height}")


# Set the background image
background_image = tk.PhotoImage(file="guilogo.gif")
image_width = background_image.width()
image_height = background_image.height()

# Calculate the target size to maintain a 2:2 small aspect ratio
target_width = 1200 
target_height = 1200

# Adjust the image size to maintain the aspect ratio
if image_width > target_width or image_height > target_height:
    ratio = min(target_width / image_width, target_height / image_height)
    new_width = int(image_width * ratio)
    new_height = int(image_height * ratio)
    background_image = background_image.subsample(new_width // image_width, new_height // image_height)

background_label = tk.Label(root, image=background_image)
background_label.place(x=0, y=0, relwidth=1, relheight=1)

# Create a frame for the content
content_frame = tk.Frame(root, bg='white', width=400, height=400)
content_frame.place(relx=0.5, rely=0.65, anchor='center')

# Add the text with a white halo
text = "Flight Delay Data Dashboard \n\n Prior to accessing the dashboard, \n\n please run this setup first"
label = tk.Label(content_frame, text=text,
                 font=('Arial', 14), bg='white', fg='black')
label.pack(pady=20)

# Add the setup button
button = tk.Button(content_frame, text='Run Setup', command=start_flask, font=('Arial', 12), width=15)
button.pack(pady=10)

# Add the link for more information
link = tk.Label(content_frame, text="Setup Documentation", fg="blue", cursor="hand2", font=('Arial', 10))
link.pack(pady=5)

# Open the link in a web browser when clicked
def open_link(event):
    webbrowser.open('https://memellsworth.github.io/Project3/journal/cards/user-experience-and-interface.html', new=1)

link.bind("<Button-1>", open_link)

def stop_flask():
    os.system('taskkill /F /IM python.exe')

button_stop = tk.Button(root, text='Stop Server', command=stop_flask, bg='light salmon')
button_stop.pack(side='bottom', pady=10)

root.mainloop()

