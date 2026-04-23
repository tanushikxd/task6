from flask import Flask, request, render_template
import mysql.connector
import os
import traceback

app = Flask(__name__)

def get_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        port=int(os.getenv("DB_PORT") or 3306),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME"),
        ssl_disabled=False
    )

@app.route("/test")
def test():
    return "OK"

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

        cursor.execute(
            "CALL generate_batch(%s, %s, %s, %s)",
            (seed, batch, locale, 10)
        )

        results = cursor.fetchall()

        cursor.close()
        conn.close()

        return render_template("index.html", data=results, batch=batch)

    except Exception:
        return f"<pre>{traceback.format_exc()}</pre>"

@app.route("/benchmark")
def benchmark():
    try:
        import time

        conn = get_connection()
        cursor = conn.cursor()

        start = time.time()
        total_users = 0

        for i in range(10):
            cursor.execute(
                "CALL generate_batch(%s, %s, %s, %s)",
                (1, i, "en_US", 10)
            )

            rows = cursor.fetchall()
            total_users += len(rows)

            while cursor.nextset():
                pass

        end = time.time()

        cursor.close()
        conn.close()

        duration = end - start
        speed = total_users / duration if duration > 0 else 0

        return f"""
        <h2>Benchmark Results</h2>
        Total users: {total_users}<br>
        Time: {duration:.2f} sec<br>
        Speed: {speed:.2f} users/sec
        """

    except Exception as e:
        import traceback
        return f"<pre>{traceback.format_exc()}</pre>"

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)