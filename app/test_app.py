import re
import pytest
from app import app, VERSION


@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client


def test_hello_status(client):
    response = client.get("/")
    assert response.status_code == 200


def test_hello_body_format(client):
    response = client.get("/")
    body = response.data.decode()
    assert re.match(r"Hello World! \(Version: .+\) \[.+\]\n", body)


def test_hello_contains_version(client):
    response = client.get("/")
    body = response.data.decode()
    assert f"Version: {VERSION}" in body
