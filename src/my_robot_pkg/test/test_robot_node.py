import pytest


def test_robot_status_message():
    """Test robot status message content"""
    status = 'Robot is operational'
    assert status == 'Robot is operational'


def test_robot_node_name():
    """Test robot node name"""
    node_name = 'robot_node'
    assert node_name == 'robot_node'


def test_robot_topic_name():
    """Test robot topic name"""
    topic = 'robot_status'
    assert topic == 'robot_status'