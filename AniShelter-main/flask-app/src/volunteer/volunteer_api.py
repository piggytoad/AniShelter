from flask import Blueprint, request, jsonify, make_response
import json
from src import db

volunteer = Blueprint('volunteer_bp', __name__)

@volunteer.route('/volunteer/timeslot', methods=['GET'])
def get_timeslots():
    cursor = db.get_db().cursor()
    cursor.execute('select number, time, date from TimeSlot')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@volunteer.route('/volunteer/timeslot/create_time', methods=['POST'])
def post_timeslot():
    cursor = db.get_db().cursor()
    id = request.form['id']
    time = request.form['time']
    date = request.form['date']
    query = f'INSERT INTO TimeSlot (id, time, date) \
        VALUES(\"{id}\", \"{time}\", \"{date}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "You have now attended at timeslot!"