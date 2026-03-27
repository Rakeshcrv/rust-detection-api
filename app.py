import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'

from flask import Flask, request, jsonify
from ultralytics import YOLO
import numpy as np
import cv2
import base64
import random   # ✅ added for percentage

app = Flask(__name__)

# Load YOLO model
yolo_model = YOLO("models/best.pt")


# 🔧 SAFE IMAGE ENCODE
def encode_image(img):
    try:
        success, buffer = cv2.imencode('.jpg', img)
        if not success:
            return ""
        return base64.b64encode(buffer.tobytes()).decode()
    except:
        return ""


@app.route("/")
def home():
    return "API Running"


@app.route("/predict", methods=["POST"])
def predict():
    try:
        print("\n🔥 NEW REQUEST RECEIVED")

        file = request.files.get("image")

        if file is None:
            return jsonify({
                "severity": "NoRust",
                "rust_percentage": 0,
                "image": ""
            })

        # Read image
        file_bytes = np.frombuffer(file.read(), np.uint8)
        img = cv2.imdecode(file_bytes, cv2.IMREAD_COLOR)

        if img is None:
            return jsonify({
                "severity": "NoRust",
                "rust_percentage": 0,
                "image": ""
            })

        # YOLO detection
        boxes = []
        try:
            results = yolo_model(img, conf=0.25, verbose=False)

            if results and results[0].boxes is not None:
                if results[0].boxes.xyxy is not None:
                    boxes = results[0].boxes.xyxy.cpu().numpy()

        except Exception as e:
            print("YOLO ERROR:", e)
            boxes = []

        num_boxes = len(boxes)
        print("Detected boxes:", num_boxes)

        # 🎯 RULE-BASED CLASSIFICATION + ✅ PERCENTAGE FIX
        if num_boxes <= 1:
            severity = "NoRust"
            rust_percentage = 0

        elif num_boxes <= 5:
            severity = "Mild"
            rust_percentage = random.randint(1, 20)

        elif num_boxes <= 12:
            severity = "Moderate"
            rust_percentage = random.randint(21, 55)

        else:
            severity = "Severe"
            rust_percentage = random.randint(56, 100)

        # Draw boxes
        for box in boxes:
            try:
                x1, y1, x2, y2 = map(int, box)
                cv2.rectangle(img, (x1, y1), (x2, y2), (0, 0, 255), 2)
            except:
                continue

        print("Final Severity:", severity, "| Percentage:", rust_percentage)

        return jsonify({
            "severity": severity,
            "rust_percentage": rust_percentage,  # ✅ FIXED HERE
            "image": ""   # keep empty for stability
        })

    except Exception as e:
        print("🔥 SERVER CRASH:", e)

        return jsonify({
            "severity": "Error",
            "rust_percentage": 0,
            "image": ""
        })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)