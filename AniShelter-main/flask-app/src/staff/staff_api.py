from flask import Blueprint, request, jsonify, make_response
import json
from src import db

staff = Blueprint('staff_bp', __name__)

@staff.route('/staff', methods=['POST'])
def add_animal():
    cursor = db.get_db().cursor()
    id = request.form['id']
    name = request.form['name']
    type = request.form['type']
    breed = request.form['breed']
    vaccinated = request.form['vaccinated']
    query = f'INSERT INTO Animal (id, name, type, breed, isVaccinated) \
        VALUES(\"{id}\", \"{name}\", \"{type}\", \"{type}\", \"{breed}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Successfully added animal to database!"

@staff.route('/staff/volunteer', methods=['GET'])
def get_volunteers():
    cursor = db.get_db().cursor()
    cursor.execute('select id, firstName, lastName from Volunteer')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

