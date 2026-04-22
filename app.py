from flask import Flask, request, render_template
import mysql.connector

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def index():
    locale = request.form.get("locale", "en_US")
    seed = int(request.form.get("seed", 1))
    batch = int(request.form.get("batch", 0))

    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="fake_data"
    )

    cursor = conn.cursor()
    cursor.callproc("generate_batch", [seed, batch, locale])

    results = []
    for result in cursor.stored_results():
        results.extend(result.fetchall())

    return render_template("index.html", data=results)

app.run(debug=True)
