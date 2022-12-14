from flask import Blueprint, request, jsonify, make_response
import json
from src import db
from datetime import datetime

adopter = Blueprint('adopter_bp', __name__)

@adopter.route('/adopter/animals', methods=['GET'])
def get_animals():
    cursor = db.get_db().cursor()
    cursor.execute('select name, type, breed from Animal')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@adopter.route('/adopter/questionaire', methods=['POST'])
def write_post():
    cursor = db.get_db().cursor()
    id = request.form['id']
    time = (datetime.now()).strftime("%H:%M")
    date = request.form['date']
    query = f'INSERT INTO Post (id, time, date) \
        VALUES(\"{id}\", \"{time}\", \"{date}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Successfully posted question!"

