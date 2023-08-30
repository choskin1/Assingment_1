from flask import Flask, render_template

app = Flask(__name__)

@app.route('/session/<group_id>')
def session(group_id):
    return render_template('session.html', group_id=group_id)

if __name__ == '__main__':
    app.run(debug=True)
