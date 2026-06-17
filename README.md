# MRX-remote
Basic android remote for my player MEDIA Revolution X, written in Delphi FMX    

This app connects to the PC via local network (UDP Broadcast) and sends simple string commands to control playback, volume, navigation, and more.   
Features     

     Playback Control: Play, Stop, Forward, Backward.   
     Media Navigation: Skip audio tracks, jump to next/previous folder.   
     Video & Subtitles: Toggle fullscreen, change aspect ratio, switch and cycle subtitles.   
     Real-time Sliders: Control Volume, Zoom, Playback Speed, and Track Position directly via TrackBars.   
     Search: Send search queries directly from the phone to the PC player.    
     Smart Call Handling: Automatically pauses the player on the PC when an incoming call is detected on the phone, and resumes playback once the call is disconnected.    
    
How it Works   
    
The app uses Indy UDP Client/Server components (IdUDPClient) to broadcast commands to the local network (default broadcast IP 192.168.0.255 on Port 1777). The PC player listens for these specific string commands and executes the corresponding actions.    
Command Protocol (Examples)      
     
     MRPLAY / MRSTOP     
     MRSETVOL<0-100> (e.g., MRSETVOL50)     
     MRSETPOS<0-1000> (e.g., MRSETPOS750 to jump to 75% of the track)      
     MRPAUSECALL (Triggered automatically on incoming call)      
     MRSEARCH<query> (Sends search text to the player)      
      
Tech Stack     
       
     IDE: Delphi RAD Studio 11+ (Targeting Android via FireMonkey - FMX)    
     Networking: Indy 10 (UDP)    
     OS Integration: Android PhoneDialer API (for call state detection)     

<img width="591" height="1280" alt="photo_2026-06-17_08-10-31" src="https://github.com/user-attachments/assets/ad7ad8f8-43eb-45df-8c70-60053f9c9960" />
