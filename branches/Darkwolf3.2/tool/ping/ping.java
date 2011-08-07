import java.io.*;
import java.util.*;
import java.net.*;

public class ping extends Thread{	
	private String IP;
	private int port;
	public ping() throws Exception{
		BufferedReader br = null; 		
		br = new BufferedReader(new InputStreamReader(System.in)); 
		System.out.println("YourIP=?");
		IP = br.readLine();		
		System.out.println("IP: " + IP);
		
		System.out.println("Serverport=?");
		port = Integer.parseInt(br.readLine());
		System.out.println("port: " + port);
	}

	public static void main(String[] args) throws Exception{
		ping p = new ping();
		p.start();		
	}
	
	public void run(){
		try{
			PingSender pingSender = new PingSender();
			pingSender.start();			
		}catch (Exception e){} 
	}	

	class PingSender extends Thread{
		private Socket socket;	
		public void run(){
			while (true){
				try{
					socket = new Socket(InetAddress.getByName(IP), port);
					System.out.println("ping send");
					sleep(5000);	
				}catch(Exception e){}		
				try{
					socket.close();
				}catch(Exception e){} 
			}
		}
	}
}
