from app1 import db, User, StudyGroup, app  # Ensure you're importing the app instance

def remove_duplicate_memberships():
    # Fetch all study groups
    study_groups = StudyGroup.query.all()

    for group in study_groups:
        seen_users = set()
        for user in group.members:
            if user.id in seen_users:
                # This is a duplicate, so remove it
                group.members.remove(user)
            else:
                seen_users.add(user.id)

    db.session.commit()

# Run the cleanup function within the application context
if __name__ == "__main__":
    with app.app_context():
        remove_duplicate_memberships()
