from waitress import serve
import web_app

serve(web_app.app, port=9000, threads=6)
