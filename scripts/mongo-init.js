// MongoDB initialization script
// This script runs when the MongoDB container starts for the first time

print('Initializing CragCrowd database...');

// Switch to the cragcrowd database
db = db.getSiblingDB('cragcrowd');

// Create collections with proper indexes
db.createCollection('sensor_readings');

// Create indexes for efficient querying
db.sensor_readings.createIndex({ "wall_id": 1 });
db.sensor_readings.createIndex({ "server_timestamp": -1 });
db.sensor_readings.createIndex({ "wall_id": 1, "server_timestamp": -1 });
db.sensor_readings.createIndex({ "created_at": -1 });

// Insert sample data for testing
db.sensor_readings.insertMany([
  {
    wall_id: "test_wall",
    device_count: 5,
    timestamp: Date.now(),
    server_timestamp: new Date(),
    created_at: new Date()
  },
  {
    wall_id: "test_wall",
    device_count: 8,
    timestamp: Date.now() - 600000, // 10 minutes ago
    server_timestamp: new Date(Date.now() - 600000),
    created_at: new Date(Date.now() - 600000)
  },
  {
    wall_id: "lower_town_wall",
    device_count: 12,
    timestamp: Date.now(),
    server_timestamp: new Date(),
    created_at: new Date()
  }
]);

print('CragCrowd database initialized successfully!');