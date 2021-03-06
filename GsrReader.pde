/* this class reads data from GSR sensor's server. however, if we run the code without the sensors error rises so
 I just commented related parts so you can run it indipendently, also, the code is manual (and still clicking simulate GSR leap)*/
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.io.IOException;
import java.util.Scanner;
import processing.net.*;

class GsrReader extends Thread implements Runnable {                                                               // reading GSR data from network[phase2]
  private float  dataIn;
  private String received ;
  private String gsrData = "";
  private DatagramSocket socket;
  private byte[] buf = new byte[256];

  GsrReader() 
  {
    try 
    {
      socket = new DatagramSocket(9109);
    }
    catch(Exception ex) 
    {
      System.err.println("An error happened in constructor!"+ ex.toString());
    }
  }


  public void run() 
  { 
    try 
    {
      while (true) 
      {
        DatagramPacket packet = new DatagramPacket(buf, buf.length);

        socket.receive(packet);
        packet = new DatagramPacket(buf, buf.length, InetAddress.getByName("localhost"), 9109);
        received = new String(packet.getData(), 0, packet.getLength());
        
        if (received.equals("end"))
        {
          socket.close();
          continue;
        }
        gsrData = received.split(",", 6)[0];
      }
    }
    catch(Exception ex)
    {
      System.err.println("An error happened in GSR UDP connection Thread!"+ ex.toString());
    }
  }


  float readData() 
  {

    if (received != null)
    { 
      dataIn = gsrData.equals("") ? 0.0 : Float.valueOf(gsrData);
    }
    return dataIn;
  }
}
