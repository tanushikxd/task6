# from flask import Flask, request, render_template
# import mysql.connector



# app = Flask(__name__)

# @app.route("/", methods=["GET", "POST"])
# def index():
#     locale = request.form.get("locale", "en_US")
#     seed = int(request.form.get("seed", 1))
#     batch = int(request.form.get("batch", 0))

#     action = request.form.get("action")

#     if action == "next":
#         batch += 1
#     if action == "generate":
#         batch = 0
#     elif action == "next":
#         batch += 1
#     conn = mysql.connector.connect(
#         host="localhost",
#         user="root",
#         password="",
#         database="fake_data"
#     )

#     cursor = conn.cursor()
#     cursor.callproc("generate_batch", [seed, batch, locale])

#     results = []
#     for result in cursor.stored_results():
#         results.extend(result.fetchall())

#     return render_template("index.html", data=results)

# app.run(debug=True)

from flask import Flask, request, render_template
import mysql.connector
import os

app = Flask(__name__)

def get_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST", "localhost"),
        port=int(os.getenv("DB_PORT", 3306)),
        user=os.getenv("DB_USER", "root"),
        password=os.getenv("DB_PASSWORD", ""),
        database=os.getenv("DB_NAME", "fake_data")
    )

@app.route("/", methods=["GET", "POST"])
def index():
    try:
        locale = request.form.get("locale", "en_US")
        seed = int(request.form.get("seed") or 1)
        batch = int(request.form.get("batch") or 0)

        action = request.form.get("action")

        if action == "generate":
            batch = 0
        elif action == "next":
            batch += 1

        conn = get_connection()
        cursor = conn.cursor()

        cursor.callproc("generate_batch", [seed, batch, locale])

        results = []
        for result in cursor.stored_results():
            results.extend(result.fetchall())

        cursor.close()
        conn.close()

        return render_template("index.html", data=results, batch=batch)

    except Exception as e:
        return f"ERROR: {str(e)}"

@app.route("/benchmark")
def benchmark():
    import time

    conn = get_connection()
    cursor = conn.cursor()

    start = time.time()
    total_users = 0

    for i in range(100):
        cursor.callproc("generate_batch", [1, i, "en_US"])
        for result in cursor.stored_results():
            rows = result.fetchall()
            total_users += len(rows)
        cursor.reset()

    end = time.time()

    cursor.close()
    conn.close()

    duration = end - start
    speed = total_users / duration

    return f"""
    Total users: {total_users}<br>
    Time: {duration:.2f} sec<br>
    Speed: {speed:.2f} users/sec
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)