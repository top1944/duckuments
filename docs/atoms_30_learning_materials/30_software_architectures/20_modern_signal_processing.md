# Modern signal processing {#modern_signal_processing status=draft}

Assigned: Andrea Censi

<div class='requirements' markdown='1'>

Result: Understanding of the concepts of
k:event-based-processing,
k:latency,
k:frequency.

</div>

## Periodic vs event-based processing

Periodic processing: data arrives periodically.

Event-based processing: data arrives at variable intervals.

Event-based processing is thus a generalization of periodic processing.

## Event triggering

### Sensor-driven processing

The sensor tells the controller when there is interesting data to process.

Assumes: k:controller, k:sensor

### Task-driven processing

The controller tells the sensor when to send data.

Assumes: k:controller, k:sensor

## Definition of quantities

### Latency

TODO: to write

### Frequency

TODO: to write

### Independence of latency and frequency

TODO: to write

### Jitter

TODO: to write

### Signal reliability

TODO: to write

Some events might be lost, because the network loses the packet.

## Design considerations and trade-offs

### Real-time system

You need a real-time system to have periodic processing.

Assumes: k:rtos

### Periodic processing is easier to analyze

Most theoretical results assume periodic processing.

### Packet losses vs latency

There are situations where sometimes you prefer to lose packets.

Assumes: k:udp, k:tcp

### Latency

See: [Latency numbers every programmer should know](https://people.eecs.berkeley.edu/~rcs/research/interactive_latency.html)


## In Duckietown

### Processing loop of line detection

Processing loop of line detection. Bounded CPU usage.


## Further reading

Actor models

Network control
