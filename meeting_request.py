from flask import Flask, request
import requests

app = Flask(__name__)

# Jitsi API configuration
JITSI_SERVER = "http://192.168.56.23"  # Replace with your Jitsi server URL
JITSI_API_TOKEN = "your-api-token"  # Replace with your Jitsi API token

@app.route('/start_meeting', methods=['POST'])
def start_meeting():
    group_id = request.form.get('group_id')

    # Generate a unique meeting room name based on the group ID
    room_name = f"group-{group_id}"

    # Create a Jitsi meeting using the Jitsi API
    response = requests.post(
        f"{JITSI_SERVER}/_api/web/v1/meetings",
        headers={"Authorization": f"Bearer {JITSI_API_TOKEN}"},
        json={"name": room_name}
    )

    if response.status_code == 200:
        # Get the meeting URL
        meeting_url = f"{JITSI_SERVER}/{room_name}"
        return f"Meeting started. Join the meeting at: {meeting_url}", 200
    else:
        return "Failed to start meeting", 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
