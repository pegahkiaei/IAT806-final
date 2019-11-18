import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Scanner;
import java.io.IOException;
import processing.net.*;
class GsrReader extends Thread implements Runnable {                                                  // reading GSR data from network[phase2]

  Client myClient; 
  private float  dataIn; 
  private String gsrData = "";
  private DatagramSocket socket;
  private boolean running;
  private byte[] buf = new byte[256];
  
  GsrReader() {
    try {
      socket = new DatagramSocket(9109);
    }
    catch(Exception ex) {
      System.err.println("An error happened in constructor!"+ ex.toString());
    }
  }


  public void run() { 
    try {
      while (true) {
        DatagramPacket packet = new DatagramPacket(buf, buf.length);

        socket.receive(packet);
        packet = new DatagramPacket(buf, buf.length, InetAddress.getByName("localhost"), 9109);
        String received = new String(packet.getData(), 0, packet.getLength());

        if (received.equals("end")) {
          running = false;
          socket.close();
          continue;
        }
        gsrData = received.split(".", 6)[0];
      }
    }
    catch(Exception ex) {
      System.err.println("An error happened in GSR UDP connection Thread!"+ ex.toString());
    }
  }


  float readData() {

    dataIn = gsrData.equals("") ? 0.0 : Float.valueOf(gsrData);
    //if (myClient.available() > 0) { 
    //  dataIn = Float.valueOf(myClient.readString().split(".", 4)[0]);
    //}
    return dataIn;
  }
}
