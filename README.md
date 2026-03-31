# UART-Based-Data-Communication-System-with-FIFO-Buffer-and-Error-Detection
# UART-Based Data Communication System with FIFO Buffer and Error Detection

---

## 📌 Overview

This project implements a **UART-based data communication system** in Verilog, featuring asynchronous serial communication, FIFO buffering, and parity-based error detection.

The design operates at **9600 baud with a 100 MHz clock** and is verified through simulation in Xilinx Vivado.

---

## 🧩 Modules

1. **uart_top.v**  
   Top-level module integrating transmitter, receiver, FIFO, and baud generator.

2. **uart_tx.v**  
   UART transmitter module that sends data in the format:  
   `Start bit + 8 Data bits + Parity + Stop bit`

3. **uart_rx.v**  
   UART receiver module that samples serial input and reconstructs 8-bit data with parity checking.

4. **fifo.v**  
   FIFO buffer used to store received data and manage data flow between RX and TX.

5. **baud_gen.v**  
   Generates baud rate timing from a 100 MHz clock.

6. **tb_uart.v**  
   Testbench used for simulation and verification.

---

## ⚙️ How It Works

1. Data is transmitted serially using the UART protocol.  
2. The transmitter frames data with start, data, parity, and stop bits.  
3. The receiver samples incoming data and reconstructs the original byte.  
4. Parity checking is performed to detect transmission errors.  
5. Received data is stored in FIFO memory.  
6. Data is read from FIFO and retransmitted.

---

## 🔢 System Specifications

- Clock Frequency: **100 MHz**  
- Baud Rate: **9600**  
- Data Width: **8-bit**  
- Parity: **Even parity**  
- Communication Type: **Asynchronous UART**

---

## 🧪 Simulation

Simulation is performed using Xilinx Vivado.

### Testbench Features:
- Generates 100 MHz clock  
- Applies reset signal  
- Simulates UART input waveform (start, data, parity, stop)

### Expected Results:
- `rx` → serial input waveform  
- `tx` → transmitted output (delayed via FIFO)  
- `parity_error` → 0 for valid data  

---

## 🚀 Usage

1. Open Vivado and create a new RTL project  
2. Add all Verilog source files  
3. Set `uart_top.v` as the top module  
4. Add `tb_uart.v` as simulation source  
5. Run behavioral simulation  
6. (Optional) Run synthesis for FPGA implementation  

---

## 📈 Key Features

- FSM-based UART transmitter and receiver  
- FIFO buffering for reliable data handling  
- Parity-based error detection  
- Modular and scalable design  
- Simulation verified  

---

## 🎯 Applications

- Serial communication systems  
- Embedded system interfaces  
- FPGA-based communication modules  
- UART protocol learning and testing  

---

## 💡 Future Improvements

- Add oversampling (8x/16x) for better noise immunity  
- Implement framing error detection  
- Support configurable baud rates  
- Deploy on FPGA hardware  

---

## 📊 Resume Highlight

Designed and implemented a UART-based data communication system in Verilog with FIFO buffering and parity-based error detection, enabling reliable asynchronous data transfer at 9600 baud.

---
