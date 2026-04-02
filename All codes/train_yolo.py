from ultralytics import YOLO

# Load base YOLOv8 model
model = YOLO("yolov8n.pt")

# Train the model
model.train(
    data="dataset/rust_detection/data.yaml",
    epochs=50,
    imgsz=640,
    batch=8,
    name="rust_detector"
)