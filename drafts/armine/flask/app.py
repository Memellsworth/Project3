import os

# Import Flask
from flask import Flask, render_template, request, redirect, url_for
from werkzeug.utils import secure_filename
from datetime import datetime

ALLOWED_EXTENSIONS = set(['csv'])

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

def create_app():
    app = Flask(__name__)
    @app.route('/upload', methods=['GET', 'POST'])
    def upload():
        if request.method == 'POST':
            file = request.files['file']
            if file and allowed_file(file.filename):
                filename = secure_filename(file.filename)
                new_filename = f'{filename.split(".")[0]}_{str(datetime.now())}.csv'
                file.save(os.path.join('input', new_filename))
                
                
            #return redirect(url_for('download'))
            return 'uploaded'

           
        return render_template('upload.html')
    
    return app


   
   