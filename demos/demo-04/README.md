# Distributed Dependency Sharing

This demo shows how dependencies may be shared in a distributed way. Note that the app shell does not use or expose `react` / `react-dom`, but the shared dependency is still loaded (once!) and used in all dependencies as it should.
