# from flask import Flask, request, render_template
# import mysql.connector
# import os
# import time

# app = Flask(__name__)

# def get_connection():
#     return mysql.connector.connect(
#         host=os.getenv("DB_HOST"),
#         port=int(os.getenv("DB_PORT")),
#         user=os.getenv("DB_USER"),
#         password=os.getenv("DB_PASSWORD"),
#         database=os.getenv("DB_NAME"),
#         ssl_disabled=False
#     )

# @app.route("/", methods=["GET", "POST"])
# def index():
#     try:
#         locale = request.form.get("locale", "en_US")
#         seed = int(request.form.get("seed") or 1)
#         batch = int(request.form.get("batch") or 0)

#         action = request.form.get("action")

#         if action == "generate":
#             batch = 0
#         elif action == "next":
#             batch += 1

#         conn = get_connection()
#         cursor = conn.cursor()

#         # ✅ 4 params (must match SQL procedure)
#         cursor.callproc("generate_batch", [seed, batch, locale, 10])

#         results = []
#         for result in cursor.stored_results():
#             results.extend(result.fetchall())

#         cursor.close()
#         conn.close()

#         return render_template("index.html", data=results, batch=batch)

#     except Exception as e:
#         print("INDEX ERROR:", e)
#         return f"ERROR: {str(e)}"


# @app.route("/benchmark")
# def benchmark():
#     try:
#         import time

#         start = time.time()
#         total_users = 0

#         for i in range(50):  # start smaller for safety
#             conn = get_connection()
#             cursor = conn.cursor()

#             cursor.callproc("generate_batch", [1, i, "en_US", 10])

#             for result in cursor.stored_results():
#                 rows = result.fetchall()
#                 total_users += len(rows)

#             cursor.close()
#             conn.close()

#         end = time.time()

#         duration = end - start
#         speed = total_users / duration if duration > 0 else 0

#         return f"""
#         <h2>Benchmark Results</h2>
#         Total users: {total_users}<br>
#         Time: {duration:.2f} sec<br>
#         Speed: {speed:.2f} users/sec
#         """

#     except Exception as e:
#         return f"BENCHMARK ERROR: {str(e)}"
# # if __name__ == "__main__":
# #     app.run(host="0.0.0.0", port=5000)

from flask import Flask, request, render_template
import mysql.connector
import os
import traceback

app = Flask(__name__)

# =========================
# DB CONNECTION
# =========================
def get_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        port=int(os.getenv("DB_PORT") or 3306),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME"),
        ssl_disabled=False
    )

# =========================
# TEST ROUTE (important)
# =========================
@app.route("/test")
def test():
    return "OK"

# =========================
# MAIN PAGE
# =========================
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

        # ✅ SAFE PROCEDURE CALL
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

# =========================
# BENCHMARK
# =========================
@app.route("/benchmark")
def benchmark():
    try:
        import time

        start = time.time()
        total_users = 0

        for i in range(20):  # safe limit for Render
            conn = get_connection()
            cursor = conn.cursor()

            cursor.execute(
                "CALL generate_batch(%s, %s, %s, %s)",
                (1, i, "en_US", 10)
            )

            rows = cursor.fetchall()
            total_users += len(rows)

            cursor.close()
            conn.close()

        end = time.time()

        duration = end - start
        speed = total_users / duration if duration > 0 else 0

        return f"""
        <h2>Benchmark Results</h2>
        Total users: {total_users}<br>
        Time: {duration:.2f} sec<br>
        Speed: {speed:.2f} users/sec
        """

    except Exception:
        return f"<pre>{traceback.format_exc()}</pre>"

# =========================
# START (Render compatible)
# =========================
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)