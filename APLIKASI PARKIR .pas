program EmeraldParking;

 uses crt, sysutils;

 type DataUser = record
	AreaParkir : String;
	AreaParkir2 : string;
	JenisMobil : String;
	JamMasuk   : Integer;
	JamKeluar  : Integer;
	NomorMobil : Integer;
	Biaya 	   : Longint;
	Durasi 	   : Integer;
 end;

 type ArrDataUser = Array [1..50] of DataUser;

 var
	Data 		 : ArrDataUser;
    i 			 : Integer;
    x 			 : Integer;
    idx  		 : Integer;
    FileDataUser : file of DataUser;
    FileI        : file of integer;
    fileX	     : file of integer;
    FileIDX      : file of integer;
    check		 : integer;

procedure MenuUtama(); forward;

procedure Menu4(); forward;

procedure Menu3(); forward;

procedure Tarif(nomor : Integer);
	
	VAR 
	 i : integer;
	begin
        clrscr;
        CursorOff;
        writeln('');
        gotoxy(32,10);writeln('EMERALD PARKING');
		gotoxy(27,12);writeln('NOMOR MOBIL : ',Data[nomor].NomorMobil);
		gotoxy(27,13);writeln('JENIS MOBIL : ',Data[nomor].JenisMobil);
		gotoxy(27,14);writeln('AREA PARKIR : ',Data[nomor].AreaParkir,' ',Data[nomor].AreaParkir2);
		Data[nomor].Durasi := Data[nomor].JamKeluar - Data[nomor].JamMasuk;

			if (lowercase(Data[nomor].JenisMobil) = 'mobil kecil') and (Data[nomor].Durasi <= 1) then
				Data[nomor].biaya := 5000

			else if (lowercase(Data[nomor].JenisMobil) = 'mobil kecil') and (Data[nomor].Durasi > 1) and (Data[nomor].Durasi <= 3) then

        			Data[nomor].biaya := 8000

			else if (lowercase(Data[nomor].JenisMobil) = 'mobil kecil') and (Data[nomor].Durasi >3) then
			
				begin
				 Data[nomor].biaya := 8000;
				 for i := 4 to Data[nomor].Durasi do
			     Data[nomor].biaya := Data[nomor].biaya +2000;
				end

			else if (lowercase(Data[nomor].JenisMobil) = 'mobil besar') and (Data[nomor].Durasi <= 1) then
				 Data[nomor].biaya := 7500

			else if (lowercase(Data[nomor].JenisMobil) = 'mobil besar') and (Data[nomor].Durasi >1) and (Data[nomor].Durasi <= 4) then
				 Data[nomor].biaya := 12500

			else if (lowercase(Data[nomor].JenisMobil) = 'mobil besar') and (Data[nomor].Durasi >4) then
			begin
				 Data[nomor].biaya := 12500;
			     for i := 5 to Data[nomor].Durasi do
			     Data[nomor].biaya := Data[nomor].biaya +3000;
				end;
		gotoxy(27,15);writeln('DURASI      : ',Data[nomor].Durasi,' JAM');
	    gotoxy(27,16);writeln('BIAYA       : ','Rp.',Data[nomor].biaya);
	    Delay(5000);
 	end;  

procedure LoadingMobil();

 var
	x : integer;
 begin
	cursoroff;
	textbackground(15);
	textcolor(cyan+ blink);
	x := 1;
	repeat
		clrscr;
		textcolor(cyan+ blink);
		writeln('');
		textcolor(random(15)+ blink);
		gotoxy(x,13);writeln('                      -----');
		gotoxy(x,14);writeln('                      ------');
		textcolor(cyan+ blink);
		gotoxy(x,11);writeln('          _____      ');
		gotoxy(x,12);writeln('     _z__//___ \_____');
		gotoxy(x,13);writeln('     [|||_| ___\ _   \');
		gotoxy(x,14);writeln('  --=[__|0|_____|0|___|');
		delay(100);
		x:= x+1
	until x = 58;
	textbackground(15);
	textcolor(cyan+ blink);
	Delay(150);
	clrscr;
 end;

procedure MenuKeluar();

	var
		nomor : Integer;
	begin
		clrscr;
		CursorOn;
		TextBackground(cyan);
		TextColor(3+ Blink);
		gotoxy(65,24);write('EMERALDPARKING');
		TextBackground(15);
		TextColor(cyan+ Blink);
		writeln('');
		gotoxy(27,12);write('NOMOR MOBIL : ');
		readln(nomor);
		clrscr;
        TextBackground(cyan);
		TextColor(3+ Blink);
		gotoxy(65,24);write('EMERALDPARKING');
        TextBackground(15);
        TextColor(cyan+ Blink);
		writeln('');
		gotoxy(28,12);write(' JAM KELUAR : ' );
		readln(Data[nomor].JamKeluar);
		CursorOff;
        Delay(1000);
        cursorOff;
        LoadingMobil;
        Tarif(nomor);
	end;

procedure Loading();
 
 begin
		clrscr;
        for x:= 0 to 100 do
        begin
        	gotoxy(21,13);
        	delay(60);
        	gotoxy(21,13);
        	cursoroff;
        	write('KARTU PARKIR ANDA SEDANG DIPROSES = ',x,'%');
        end;
 end;

procedure CetakKartu();
	
	begin
        clrscr;
        loading;
        clrscr;
        cursorOff;

        If (lowercase(Data[idx].AreaParkir) = 'a1') or (lowercase(Data[idx].AreaParkir) = 'a2') or (lowercase(Data[idx].AreaParkir) = 'a3')
		or (lowercase(Data[idx].AreaParkir) = 'a4') or (lowercase(Data[idx].AreaParkir) = 'a5') or (lowercase(Data[idx].AreaParkir) = 'a6')
		or (lowercase(Data[idx].AreaParkir) = 'a7') or (lowercase(Data[idx].AreaParkir) = 'a8') or (lowercase(Data[idx].AreaParkir) = 'a9')
		or (lowercase(Data[idx].AreaParkir) = 'a0') then
		
			begin
			TextBackground(red);
			TextColor(white + blink);
			clrscr;
	        writeln('');
	       	gotoxy(32,9);writeln('EMERALD PARKING');
			writeln(' ');
			gotoxy(27,12);writeln('NOMOR MOBIL : ',Data[idx].NomorMobil);
			gotoxy(27,13);writeln('JENIS MOBIL : ',Data[idx].JenisMobil);
			gotoxy(27,14);writeln('JAM MASUK   : ',Data[idx].JamMasuk);
			gotoxy(27,15);writeln('AREA PARKIR : ',Data[idx].AreaParkir,' ',Data[idx].AreaParkir2);
			Delay(2000);
			TextBackground(15);
	        TextColor(cyan+ Blink);
	        end

        else If (lowercase(Data[idx].AreaParkir) = 'b1') or (lowercase(Data[idx].AreaParkir) = 'b2') or (lowercase(Data[idx].AreaParkir) = 'b3')
			 or (lowercase(Data[idx].AreaParkir) = 'b4') or (lowercase(Data[idx].AreaParkir) = 'b5') or (lowercase(Data[idx].AreaParkir) = 'b6')
			 or (lowercase(Data[idx].AreaParkir) = 'b7') or (lowercase(Data[idx].AreaParkir) = 'b8') or (lowercase(Data[idx].AreaParkir) = 'b9')
			 or (lowercase(Data[idx].AreaParkir) = 'b0') then
		
			begin
			TextBackground(yellow);
			TextColor(white + blink);
			clrscr;
	        writeln('');
	       	gotoxy(32,9);writeln('EMERALD PARKING');
			writeln(' ');
			gotoxy(27,12);writeln('NOMOR MOBIL : ',Data[idx].NomorMobil);
			gotoxy(27,13);writeln('JENIS MOBIL : ',Data[idx].JenisMobil);
			gotoxy(27,14);writeln('JAM MASUK   : ',Data[idx].JamMasuk);
			gotoxy(27,15);writeln('AREA PARKIR : ',Data[idx].AreaParkir,' ',Data[idx].AreaParkir2);
			Delay(2000);
			TextBackground(15);
	        TextColor(cyan+ Blink);
	        end

        else If (lowercase(Data[idx].AreaParkir) = 'c1') or (lowercase(Data[idx].AreaParkir) = 'c2') or (lowercase(Data[idx].AreaParkir) = 'c3')
			 or (lowercase(Data[idx].AreaParkir) = 'c4') or (lowercase(Data[idx].AreaParkir) = 'c5') or (lowercase(Data[idx].AreaParkir) = 'c6')
			 or (lowercase(Data[idx].AreaParkir) = 'c7') or (lowercase(Data[idx].AreaParkir) = 'c8') or (lowercase(Data[idx].AreaParkir) = 'c9')
			 or (lowercase(Data[idx].AreaParkir) = 'c0') then
		
			begin
			TextBackground(green);
			TextColor(white + blink);
			clrscr;
	        writeln('');
	       	gotoxy(32,9);writeln('EMERALD PARKING');
			writeln(' ');
			gotoxy(27,12);writeln('NOMOR MOBIL : ',Data[idx].NomorMobil);
			gotoxy(27,13);writeln('JENIS MOBIL : ',Data[idx].JenisMobil);
			gotoxy(27,14);writeln('JAM MASUK   : ',Data[idx].JamMasuk);
			gotoxy(27,15);writeln('AREA PARKIR : ',Data[idx].AreaParkir,' ',Data[idx].AreaParkir2);
			Delay(2000);
			TextBackground(15);
	        TextColor(cyan+ Blink);
	        end

        else If (lowercase(Data[idx].AreaParkir) = 'd1') or (lowercase(Data[idx].AreaParkir) = 'd2') or (lowercase(Data[idx].AreaParkir) = 'd3')
			 or (lowercase(Data[idx].AreaParkir) = 'd4') or (lowercase(Data[idx].AreaParkir) = 'd5') or (lowercase(Data[idx].AreaParkir) = 'd6')
		   	 or (lowercase(Data[idx].AreaParkir) = 'd7') or (lowercase(Data[idx].AreaParkir) = 'd8') or (lowercase(Data[idx].AreaParkir) = 'd9')
			 or (lowercase(Data[idx].AreaParkir) = 'd0') then
			
			begin
			TextBackground(11);
			TextColor(white + blink);
			clrscr;
	        writeln('');
	       	gotoxy(32,9);writeln('EMERALD PARKING');
			writeln(' ');
			gotoxy(27,12);writeln('NOMOR MOBIL : ',Data[idx].NomorMobil);
			gotoxy(27,13);writeln('JENIS MOBIL : ',Data[idx].JenisMobil);
			gotoxy(27,14);writeln('JAM MASUK   : ',Data[idx].JamMasuk);
			gotoxy(27,15);writeln('AREA PARKIR : ',Data[idx].AreaParkir,' ',Data[idx].AreaParkir2);
			Delay(2000);
			TextBackground(15);
	        TextColor(cyan+ Blink);
	        end

        else If (lowercase(Data[idx].AreaParkir) = 'e1') or (lowercase(Data[idx].AreaParkir) = 'e2') or (lowercase(Data[idx].AreaParkir) = 'e3')
			 or (lowercase(Data[idx].AreaParkir) = 'e4') or (lowercase(Data[idx].AreaParkir) = 'e5') or (lowercase(Data[idx].AreaParkir) = 'e6')
			 or (lowercase(Data[idx].AreaParkir) = 'e7') or (lowercase(Data[idx].AreaParkir) = 'e8') or (lowercase(Data[idx].AreaParkir) = 'e9')
			 or (lowercase(Data[idx].AreaParkir) = 'e0') then
		
			begin
			TextBackground(blue);
			TextColor(white + blink);
			clrscr;
	        writeln('');
	       	gotoxy(32,9);writeln('EMERALD PARKING');
			writeln(' ');
			gotoxy(27,12);writeln('NOMOR MOBIL : ',Data[idx].NomorMobil);
			gotoxy(27,13);writeln('JENIS MOBIL : ',Data[idx].JenisMobil);
			gotoxy(27,14);writeln('JAM MASUK   : ',Data[idx].JamMasuk);
			gotoxy(27,15);writeln('AREA PARKIR : ',Data[idx].AreaParkir,' ',Data[idx].AreaParkir2);
			Delay(2000);
			TextBackground(15);
	        TextColor(cyan+ Blink);
	        end;
	end;

procedure CekAreaParkir;
	
	var
		index : Integer;
		index2 : integer;
		found : Boolean;
		ArrArea : array [1..50] of string = ('A1','A2','A3','A4','A5','A6','A7','A8','A9','A0',
											 'B1','B2','B3','B4','B5','B6','B7','B8','B9','B0',
											 'C1','C2','C3','C4','C5','C6','C7','C8','C9','C0',
											 'D1','D2','D3','D4','D5','D6','D7','D8','D9','D0',
											 'E1','E2','E3','E4','E5','E6','E7','E8','E9','E0'); 
 begin

		textbackground(15);
		textcolor(black+ blink);
        clrscr;
        writeln;
        textbackground(15);
        textcolor(cyan+ blink);
        writeln;
        writeln;
		gotoxy(10,3);writeln('[============================================================]');
		gotoxy(10,4);writeln('[-----------------------  AREA PARKIR  ----------------------]');
		gotoxy(10,5);writeln('[============================================================]');
		gotoxy(10,6);writeln('|                                                            |');
		gotoxy(10,7);writeln('| IN ------------------------ XX ------------------------OUT |');
		gotoxy(10,8);writeln('|                                                            |');
		textbackground(red);
		textcolor(cyan+ blink);
		gotoxy(10,9);writeln('| |A1| |A2| |A3| |A4| |A5|   |  |   |A6| |A7| |A8| |A9| |A0| |');
		textbackground(15);
		gotoxy(10,10);writeln('| ---------------------------    --------------------------- |');
		textbackground(yellow); 
		gotoxy(10,11);writeln('| |B1| |B2| |B3| |B4| |B5|   |  |   |B6| |B7| |B8| |B9| |B0| |');
		textbackground(15);
		gotoxy(10,12);writeln('| ---------------------------    --------------------------- |');
		textbackground(green);
		gotoxy(10,13);writeln('| |C1| |C2| |C3| |C4| |C5|   |  |   |C6| |C7| |C8| |C9| |C0| |');
		textbackground(15);
		gotoxy(10,14);writeln('| ---------------------------    --------------------------- |');
		textbackground(11);
	    gotoxy(10,15);writeln('| |D1| |D2| |D3| |D4| |D5|   |  |   |D6| |D7| |D8| |D9| |D0| |');
	   	textbackground(15);
		gotoxy(10,16);writeln('| ---------------------------    --------------------------- |');
		textbackground(blue);
	   	gotoxy(10,17);writeln('| |E1| |E2| |E3| |E4| |E5|   |  |   |E6| |E7| |E8| |E9| |E0| |');
	   	textbackground(15);
	   	gotoxy(10,18);writeln('|                             \/                             |' );
		gotoxy(10,19);writeln('[============================================================]');
		gotoxy(10,21);writeln('AREA PARKIR YANG TERSEDIA : ');
		writeln;
	  	cursoroff;
	 	TextBackground(15);
      	TextColor(cyan+ Blink);
      
      	For index := 1 to 50 do
      	  begin
      	  found := false;
      		for index2 := 1 to 50 do
      		  begin
      		  	if ArrArea[index] = Data[index2].AreaParkir then
      		  	found := true;
      		  	if ArrArea[index] = Data[index2].AreaParkir2 then 
      		  	found := true;
      		  end;
      		    if not found then 
      		    write('     ',ArrArea[index],' ');
      	  end;
 end;

function AreaParkirPenuh(i : integer; Area : string ; Data : ArrDataUser ) : Boolean;
	var
		idx : Integer;
	begin
		AreaParkirPenuh := True;
		For idx := 1 to 50 do
		begin
			If (lowercase(Data[idx].AreaParkir) = lowercase(Area)) and (idx <> i) then
				AreaParkirPenuh := False;
		end;
	end;

procedure PembelianTiketParkir();
	
	begin

		idx := idx +1;
        clrscr;
        CursorOn;
		writeln('');
		TextBackground(cyan);
		TextColor(3+ Blink);
		gotoxy(65,24);write('EMERALDPARKING');
		textbackground(15);
		TextColor(Cyan+ Blink);
        gotoxy(28,12);write('JENIS MOBIL : ');
		readln(Data[idx].JenisMobil);
		
				CursorOff;
                Delay(1250);
                
                        while (lowercase(Data[idx].JenisMobil) <> 'mobil kecil') and (lowercase(Data[idx].JenisMobil) <> 'mobil besar') do
                      		 begin
		                        TextBackground(15);
		                        TextColor(Red+ Blink);
		                        clrscr;
		                        writeln(' ');
		                        TextBackground(red);
								TextColor(white+ Blink);
		                        gotoxy(23,12);writeln(' MAAF JENIS MOBIL YANG ANDA MASUKKAN SALAH ');
		                        TextBackground(15);
		                        TextColor(cyan+ Blink);
		                        CursorOff;
		                        Delay(3000);
		                        CursorOn;
		                        clrscr;
		                        TextBackground(cyan);
								TextColor(3+ Blink);
								gotoxy(65,24);write('EMERALDPARKING');
		                     	TextBackground(15);
		                        TextColor(cyan+ Blink);
		                        gotoxy(28,12);write('JENIS MOBIL : ');
		                        readln(Data[idx].JenisMobil);
		                        cursorOff;
		                        Delay(1250);
                             end;
        clrscr;
        CursorOn;
        TextBackground(cyan);
		TextColor(3+ Blink);
		gotoxy(65,24);write('EMERALDPARKING');
        TextBackground(15);
        TextColor(cyan+ Blink);
		writeln('');
		gotoxy(28,12);write(' JAM MASUK : ');
		readln(Data[idx].JamMasuk);
		CursorOff;
		Delay(1250);
		
			begin
				If (Data[idx].JamMasuk >= 6) and (Data[idx].JamMasuk < 23) then
				writeln(' ')
			else
				begin
						clrscr;
						TextBackground(red);
						TextColor(white+ Blink);
						gotoxy(13,13);writeln(' Maaf EmeraldParking hanya beroperasi pukul 06.00 - 23.00 ');
						TextBackground(15);
                        TextColor(cyan+ Blink);
						Delay(5000);
						clrscr;
						CursorON;
						TextBackground(cyan);
						TextColor(3+ Blink);
						gotoxy(65,24);write('EMERALDPARKING');
                     	TextBackground(15);
                        TextColor(cyan+ Blink);
						gotoxy(28,12);write(' JAM MASUK : ');
						readln(Data[idx].JamMasuk);
						
							begin
								If (Data[idx].JamMasuk >= 6) and (Data[idx].JamMasuk < 23) then
								writeln(' ')
							else
						
								begin
								clrscr;
								TextBackground(red);
								TextColor(white+ Blink);
								gotoxy(13,13);writeln(' Maaf EmeraldParking hanya beroperasi pukul 06.00 - 23.00 ');
								TextBackground(15);
		                        Textcolor(cyan+ Blink);
		                        cursorOff;
								Delay(5000);
								clrscr;
								CursorON;
								TextBackground(cyan);
								TextColor(3+ Blink);
								gotoxy(65,24);write('EMERALDPARKING');
		                     	TextBackground(15);
		                        TextColor(cyan+ Blink);
								gotoxy(28,12);write(' JAM MASUK : ');
								readln(Data[idx].JamMasuk);
								
									begin
										If (Data[idx].JamMasuk > 6) and (Data[idx].JamMasuk < 23) then
											writeln(' ')
										else
											begin
											halt;
											end;
									end;
								end;
							end;
				end;
			end;
		
		repeat 
			writeln('');
			cursorOn;
			clrscr;
			TextBackground(cyan);
			TextColor(3+ Blink);
			gotoxy(65,24);write('EMERALDPARKING');
			textbackground(15);
			TextColor(Cyan+ Blink);
			gotoxy(28,12);write('AREA PARKIR : ');
			Data[idx].AreaParkir2 := '  ';

			iF lowercase(Data[idx].JenisMobil) = 'mobil kecil' then
			begin	
				readln(Data[idx].AreaParkir);
			end;
			If (lowercase(Data[idx].JenisMobil) = 'mobil besar') then
			begin
				readln(Data[idx].AreaParkir);
				gotoxy(44,12);write(' ');readln(Data[idx].AreaParkir2);
			end;
		
		    If AreaParkirPenuh(idx,Data[idx].AreaParkir,Data) = False then

				begin
					clrscr;
					TextBackground(red);
					TextColor(white+ Blink);
					gotoxy(22,13);writeln(' MAAF AREA PARKIR TERSEBUT SUDAH TERISI ');
					TextBackground(15);
		            Textcolor(cyan+ Blink);
		            cursorOff;
					Delay(3000);
					clrscr;
				end;

		until AreaParkirPenuh(idx,Data[idx].AreaParkir,Data);

			begin
				while   (lowercase(Data[idx].AreaParkir) <> 'a1')and (lowercase(Data[idx].AreaParkir) <> 'a2')and (lowercase(Data[idx].AreaParkir) <> 'a3')
					and (lowercase(Data[idx].AreaParkir) <> 'a4')and (lowercase(Data[idx].AreaParkir) <> 'a5')and (lowercase(Data[idx].AreaParkir) <> 'a6')
					and (lowercase(Data[idx].AreaParkir) <> 'a7')and (lowercase(Data[idx].AreaParkir) <> 'a8')and (lowercase(Data[idx].AreaParkir) <> 'a9')
					and (lowercase(Data[idx].AreaParkir) <> 'a0')and (lowercase(Data[idx].AreaParkir) <> 'b0')and (lowercase(Data[idx].AreaParkir) <> 'b1')
					and (lowercase(Data[idx].AreaParkir) <> 'b2')and (lowercase(Data[idx].AreaParkir) <> 'b3')and (lowercase(Data[idx].AreaParkir) <> 'b4')
					and (lowercase(Data[idx].AreaParkir) <> 'b5')and (lowercase(Data[idx].AreaParkir) <> 'b6')and (lowercase(Data[idx].AreaParkir) <> 'b7')
					and (lowercase(Data[idx].AreaParkir) <> 'b8')and (lowercase(Data[idx].AreaParkir) <> 'b9')and (lowercase(Data[idx].AreaParkir) <> 'c1')
					and (lowercase(Data[idx].AreaParkir) <> 'c2')and (lowercase(Data[idx].AreaParkir) <> 'c3')and (lowercase(Data[idx].AreaParkir) <> 'c0')
					and (lowercase(Data[idx].AreaParkir) <> 'c4')and (lowercase(Data[idx].AreaParkir) <> 'c5')and (lowercase(Data[idx].AreaParkir) <> 'c6')
					and (lowercase(Data[idx].AreaParkir) <> 'c7')and (lowercase(Data[idx].AreaParkir) <> 'c8')and (lowercase(Data[idx].AreaParkir) <> 'c9')
					and (lowercase(Data[idx].AreaParkir) <> 'c1')and (lowercase(Data[idx].AreaParkir) <> 'c2')and (lowercase(Data[idx].AreaParkir) <> 'c3')
					and (lowercase(Data[idx].AreaParkir) <> 'c4')and (lowercase(Data[idx].AreaParkir) <> 'c5')and (lowercase(Data[idx].AreaParkir) <> 'c6')
					and (lowercase(Data[idx].AreaParkir) <> 'c7')and (lowercase(Data[idx].AreaParkir) <> 'c8')and (lowercase(Data[idx].AreaParkir) <> 'c9')
					and (lowercase(Data[idx].AreaParkir) <> 'c0')and (lowercase(Data[idx].AreaParkir) <> 'e0')and (lowercase(Data[idx].AreaParkir) <> 'd0') 
					and (lowercase(Data[idx].AreaParkir) <> 'd0')and (lowercase(Data[idx].AreaParkir) <> 'e0')and (lowercase(Data[idx].AreaParkir) <> 'e9')
					and (lowercase(Data[idx].AreaParkir) <> 'd1')and (lowercase(Data[idx].AreaParkir) <> 'd2')and (lowercase(Data[idx].AreaParkir) <> 'd3')
					and (lowercase(Data[idx].AreaParkir) <> 'd4')and (lowercase(Data[idx].AreaParkir) <> 'd5')and (lowercase(Data[idx].AreaParkir) <> 'd6')
					and (lowercase(Data[idx].AreaParkir) <> 'd7')and (lowercase(Data[idx].AreaParkir) <> 'd8')and (lowercase(Data[idx].AreaParkir) <> 'd9')
					and (lowercase(Data[idx].AreaParkir) <> 'e1')and (lowercase(Data[idx].AreaParkir) <> 'e2')and (lowercase(Data[idx].AreaParkir) <> 'e3')
					and (lowercase(Data[idx].AreaParkir) <> 'e4')and (lowercase(Data[idx].AreaParkir) <> 'e5')and (lowercase(Data[idx].AreaParkir) <> 'e6')
					and (lowercase(Data[idx].AreaParkir) <> 'e7')and (lowercase(Data[idx].AreaParkir) <> 'e8') do
					
                       begin
                        TextBackground(15);
                        TextColor(Red+ Blink);
                        clrscr;
                        writeln(' ');
                        TextBackground(red);
						TextColor(white+ Blink);
                        gotoxy(20,12);writeln(' MAAF AREA PARKIR YANG ANDA MASUKKAN SALAH ');
                        TextBackground(15);
                        TextColor(cyan+ Blink);
                        CursorOff;
                        Delay(3000);
                        CursorOn;
                        clrscr;
                        TextBackground(cyan);
						TextColor(3+ Blink);
						gotoxy(65,24);write('EMERALDPARKING');
                     	TextBackground(15);
                        TextColor(cyan+ Blink);
                        gotoxy(28,12);write('AREA PARKIR : ');
                        readln(Data[idx].AreaParkir);
                        readln(Data[idx].AreaParkir2);
                        cursorOff;
                        Delay(1250);
                       end;
                     
			end;
		cursorOff;
        Delay(1250);
        Data[idx].NomorMobil := Data[idx].NomorMobil +idx;
	end;

procedure ViewNomorMobil ();
	var
	     pass : Integer;
	begin
		clrscr;
		writeln(' --------------------------------------------------------------------');
		writeln('|  NOMOR MOBIL      JENIS MOBIL       AREA PARKIR      JAM MASUK     |');
		writeln(' --------------------------------------------------------------------');
		FOR pass :=1 to idx do
		begin
			cursoroff;
			If (lowercase(Data[pass].AreaParkir) = 'a1') or (lowercase(Data[pass].AreaParkir) = 'a2') or (lowercase(Data[pass].AreaParkir) = 'a3')
			or (lowercase(Data[pass].AreaParkir) = 'a4') or (lowercase(Data[pass].AreaParkir) = 'a5') or (lowercase(Data[pass].AreaParkir) = 'a6')
			or (lowercase(Data[pass].AreaParkir) = 'a7') or (lowercase(Data[pass].AreaParkir) = 'a8') or (lowercase(Data[pass].AreaParkir) = 'a9')
			or (lowercase(Data[pass].AreaParkir) = 'a0') then

				begin
					TextBackground(red);
					TextColor(white + blink);
					write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
									Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'             ',Data[pass].JamMasuk,'        ');
					TextBackground(15);
			        TextColor(cyan+ Blink);
			        writeln('');
       			end

		else If (lowercase(Data[pass].AreaParkir) = 'b1') or (lowercase(Data[pass].AreaParkir) = 'b2') or (lowercase(Data[pass].AreaParkir) = 'b3')
			 or (lowercase(Data[pass].AreaParkir) = 'b4') or (lowercase(Data[pass].AreaParkir) = 'b5') or (lowercase(Data[pass].AreaParkir) = 'b6')
			 or (lowercase(Data[pass].AreaParkir) = 'b7') or (lowercase(Data[pass].AreaParkir) = 'b8') or (lowercase(Data[pass].AreaParkir) = 'b9')
			 or (lowercase(Data[pass].AreaParkir) = 'b0') then

				begin
					TextBackground(yellow);
					TextColor(white + blink);
					write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
									Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'             ',Data[pass].JamMasuk,'        ');
					TextBackground(15);
			        TextColor(cyan+ Blink);
			        writeln('');
			    end

        else If (lowercase(Data[pass].AreaParkir) = 'c1') or (lowercase(Data[pass].AreaParkir) = 'c2') or (lowercase(Data[pass].AreaParkir) = 'c3')
			 or (lowercase(Data[pass].AreaParkir) = 'c4') or (lowercase(Data[pass].AreaParkir) = 'c5') or (lowercase(Data[pass].AreaParkir) = 'c6')
			 or (lowercase(Data[pass].AreaParkir) = 'c7') or (lowercase(Data[pass].AreaParkir) = 'c8') or (lowercase(Data[pass].AreaParkir) = 'c9')
			 or (lowercase(Data[pass].AreaParkir) = 'c0') then

				begin
					TextBackground(green);
					TextColor(white + blink);
					write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
									Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'             ',Data[pass].JamMasuk,'       ');
					TextBackground(15);
			        TextColor(cyan+ Blink);
			        writeln('');
		        end

        else If (lowercase(Data[pass].AreaParkir) = 'd1') or (lowercase(Data[pass].AreaParkir) = 'd2') or (lowercase(Data[pass].AreaParkir) = 'd3')
			 or (lowercase(Data[pass].AreaParkir) = 'd4') or (lowercase(Data[pass].AreaParkir) = 'd5') or (lowercase(Data[pass].AreaParkir) = 'd6')
			 or (lowercase(Data[pass].AreaParkir) = 'd7') or (lowercase(Data[pass].AreaParkir) = 'd8') or (lowercase(Data[pass].AreaParkir) = 'd9')
			 or (lowercase(Data[pass].AreaParkir) = 'd0') then

				begin
					TextBackground(11);
					TextColor(white + blink);
					write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
									Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'             ',Data[pass].JamMasuk,'       ');
					TextBackground(15);
			        TextColor(cyan+ Blink);
			        writeln('');
		        end 

        else If (lowercase(Data[pass].AreaParkir) = 'e1') or (lowercase(Data[pass].AreaParkir) = 'e2') or (lowercase(Data[pass].AreaParkir) = 'e3')
			 or (lowercase(Data[pass].AreaParkir) = 'e4') or (lowercase(Data[pass].AreaParkir) = 'e5') or (lowercase(Data[pass].AreaParkir) = 'e6')
			 or (lowercase(Data[pass].AreaParkir) = 'e7') or (lowercase(Data[pass].AreaParkir) = 'e8') or (lowercase(Data[pass].AreaParkir) = 'e9')
			 or (lowercase(Data[pass].AreaParkir) = 'e0') then

				begin
					TextBackground(blue);
					TextColor(white + blink);
					write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
									Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'             ',Data[pass].JamMasuk,'       ');
					TextBackground(15);
			        TextColor(cyan+ Blink);
			        writeln('');
		        end
		end;
		writeln(' --------------------------------------------------------------------');
		READLN;
	end;

procedure SortingNomorMobil();

	var
  	pass ,check, idx_max : integer;
  	temp : DataUser;
 		
 		begin
  			for pass := 1 to idx-1 do
  				begin
   				 idx_max := pass;
   				 for check := pass + 1 to idx do
   					begin
    					if (Data[check].NomorMobil ) < (Data[idx_max].NomorMobil) then
     					idx_max := check;
   					end;
   				 temp            := Data[idx_max];
   				 Data[idx_max] := Data[pass];
   				 Data[pass]    := temp;
  				end;
 		end;{Selection Sort Ascending}

procedure SortingDurasiParkir();

	var
  	pass ,check, idx_max : integer;
  	temp : DataUser;
 		
 		begin
  			for pass := 1 to idx-1 do
  				begin
   				 idx_max := pass;
   				 for check := pass + 1 to idx do
   					begin
    					if (Data[check].Durasi )< (Data[idx_max].Durasi) then
     					idx_max := check;
   					end;
   				 temp            := Data[idx_max];
   				 Data[idx_max] := Data[pass];
   				 Data[pass]    := temp;
  				end;
 		end;{Selection Sort Ascending}

procedure SortingJenisMobil();

	var
  	pass ,check, idx_max : integer;
  	temp : DataUser;
 		
 		begin
  			for pass := 1 to idx-1 do
  				begin
   				idx_max := pass;
   					for check := pass + 1 to idx do
   					begin
    					if ((Data[check].JenisMobil )> (Data[idx_max].JenisMobil)) then
     					idx_max := check;
   					end;
   				temp            := Data[idx_max];
   				Data[idx_max] := Data[pass];
   				Data[pass]    := temp;
  			end;
 		end;{Selection Sort Ascending}

procedure ViewBiaya ();
	var
	     pass : Integer;
	begin
		clrscr;
		writeln(' --------------------------------------------------------------------');
		writeln('|  NOMOR MOBIL      JENIS MOBIL       AREA PARKIR      BIAYA         |');
		writeln(' --------------------------------------------------------------------');
		
			FOR pass :=1 to idx do
				begin
					cursoroff;
					If (lowercase(Data[pass].AreaParkir) = 'a1') or (lowercase(Data[pass].AreaParkir) = 'a2') or (lowercase(Data[pass].AreaParkir) = 'a3')
					or (lowercase(Data[pass].AreaParkir) = 'a4') or (lowercase(Data[pass].AreaParkir) = 'a5') or (lowercase(Data[pass].AreaParkir) = 'a6')
					or (lowercase(Data[pass].AreaParkir) = 'a7') or (lowercase(Data[pass].AreaParkir) = 'a8') or (lowercase(Data[pass].AreaParkir) = 'a9')
					or (lowercase(Data[pass].AreaParkir) = 'a0') then

						begin
							TextBackground(red);
							TextColor(white + blink);
							write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
											Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'        ',Data[pass].biaya,'         ');
							TextBackground(15);
					        TextColor(cyan+ Blink);
					        writeln('');
				        end

					else If (lowercase(Data[pass].AreaParkir) = 'b1') or (lowercase(Data[pass].AreaParkir) = 'b2') or (lowercase(Data[pass].AreaParkir) = 'b3')
						 or (lowercase(Data[pass].AreaParkir) = 'b4') or (lowercase(Data[pass].AreaParkir) = 'b5') or (lowercase(Data[pass].AreaParkir) = 'b6')
						 or (lowercase(Data[pass].AreaParkir) = 'b7') or (lowercase(Data[pass].AreaParkir) = 'b8') or (lowercase(Data[pass].AreaParkir) = 'b9')
						 or (lowercase(Data[pass].AreaParkir) = 'b0') then

						begin
							TextBackground(yellow);
							TextColor(white + blink);
							write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
											Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'        ',Data[pass].biaya,'         ');

							TextBackground(15);
					        TextColor(cyan+ Blink);
					        writeln('');
				        end

			        else If (lowercase(Data[pass].AreaParkir) = 'c1') or (lowercase(Data[pass].AreaParkir) = 'c2') or (lowercase(Data[pass].AreaParkir) = 'c3')
					 	 or (lowercase(Data[pass].AreaParkir) = 'c4') or (lowercase(Data[pass].AreaParkir) = 'c5') or (lowercase(Data[pass].AreaParkir) = 'c6')
				 		 or (lowercase(Data[pass].AreaParkir) = 'c7') or (lowercase(Data[pass].AreaParkir) = 'c8') or (lowercase(Data[pass].AreaParkir) = 'c9')
						 or (lowercase(Data[pass].AreaParkir) = 'c0') then

							begin
								TextBackground(green);
								TextColor(white + blink);
								write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
												Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'        ',Data[pass].biaya,'          ');
								TextBackground(15);
						        TextColor(cyan+ Blink);
						        writeln('');
		        			end

			        else If (lowercase(Data[pass].AreaParkir) = 'd1') or (lowercase(Data[pass].AreaParkir) = 'd2') or (lowercase(Data[pass].AreaParkir) = 'd3')
						 or (lowercase(Data[pass].AreaParkir) = 'd4') or (lowercase(Data[pass].AreaParkir) = 'd5') or (lowercase(Data[pass].AreaParkir) = 'd6')
						 or (lowercase(Data[pass].AreaParkir) = 'd7') or (lowercase(Data[pass].AreaParkir) = 'd8') or (lowercase(Data[pass].AreaParkir) = 'd9')
						 or (lowercase(Data[pass].AreaParkir) = 'd0') then

							begin
								TextBackground(11);
								TextColor(white + blink);
								write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
												Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'        ',Data[pass].biaya,'         ');
								TextBackground(15);
						        TextColor(cyan+ Blink);
						        writeln('');
					        end 

			        else If (lowercase(Data[pass].AreaParkir) = 'e1') or (lowercase(Data[pass].AreaParkir) = 'e2') or (lowercase(Data[pass].AreaParkir) = 'e3')
						 or (lowercase(Data[pass].AreaParkir) = 'e4') or (lowercase(Data[pass].AreaParkir) = 'e5') or (lowercase(Data[pass].AreaParkir) = 'e6')
						 or (lowercase(Data[pass].AreaParkir) = 'e7') or (lowercase(Data[pass].AreaParkir) = 'e8') or (lowercase(Data[pass].AreaParkir) = 'e9')
						 or (lowercase(Data[pass].AreaParkir) = 'e0') then

							begin
								TextBackground(blue);
								TextColor(white + blink);
								write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
												Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'        ',Data[pass].biaya,'         ');
								TextBackground(15);
						        TextColor(cyan+ Blink);
						        writeln('');
		       				end
				end;
		writeln(' --------------------------------------------------------------------');
		READLN;
	end;

procedure ViewDurasi ();
	var
	     pass : Integer;
	begin
		clrscr;
		writeln(' --------------------------------------------------------------------');
		writeln('|  NOMOR MOBIL      JENIS MOBIL       AREA PARKIR      Durasi         |');
		writeln(' --------------------------------------------------------------------');
		
		FOR pass :=1 to idx do
			begin
			cursoroff;
				If (lowercase(Data[pass].AreaParkir) = 'a1') or (lowercase(Data[pass].AreaParkir) = 'a2') or (lowercase(Data[pass].AreaParkir) = 'a3')
				or (lowercase(Data[pass].AreaParkir) = 'a4') or (lowercase(Data[pass].AreaParkir) = 'a5') or (lowercase(Data[pass].AreaParkir) = 'a6')
				or (lowercase(Data[pass].AreaParkir) = 'a7') or (lowercase(Data[pass].AreaParkir) = 'a8') or (lowercase(Data[pass].AreaParkir) = 'a9')
				or (lowercase(Data[pass].AreaParkir) = 'a0') then

					begin
						TextBackground(red);
						TextColor(white + blink);
						write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
										Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'       ',Data[pass].Durasi,' Jam         ');
						TextBackground(15);
				        TextColor(cyan+ Blink);
				        writeln('');
			        end

				else If (lowercase(Data[pass].AreaParkir) = 'b1') or (lowercase(Data[pass].AreaParkir) = 'b2') or (lowercase(Data[pass].AreaParkir) = 'b3')
					 or (lowercase(Data[pass].AreaParkir) = 'b4') or (lowercase(Data[pass].AreaParkir) = 'b5') or (lowercase(Data[pass].AreaParkir) = 'b6')
					 or (lowercase(Data[pass].AreaParkir) = 'b7') or (lowercase(Data[pass].AreaParkir) = 'b8') or (lowercase(Data[pass].AreaParkir) = 'b9')
					 or (lowercase(Data[pass].AreaParkir) = 'b0') then

					begin
						TextBackground(yellow);
						TextColor(white + blink);
						write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
										Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'       ',Data[pass].Durasi,' Jam         ');

						TextBackground(15);
				        TextColor(cyan+ Blink);
				        writeln('');
			        end

		        else If (lowercase(Data[pass].AreaParkir) = 'c1') or (lowercase(Data[pass].AreaParkir) = 'c2') or (lowercase(Data[pass].AreaParkir) = 'c3')
					 or (lowercase(Data[pass].AreaParkir) = 'c4') or (lowercase(Data[pass].AreaParkir) = 'c5') or (lowercase(Data[pass].AreaParkir) = 'c6')
					 or (lowercase(Data[pass].AreaParkir) = 'c7') or (lowercase(Data[pass].AreaParkir) = 'c8') or (lowercase(Data[pass].AreaParkir) = 'c9')
					 or (lowercase(Data[pass].AreaParkir) = 'c0') then
					
					begin
						TextBackground(green);
						TextColor(white + blink);
						write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
										Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'       ',Data[pass].Durasi,' jam         ');
						TextBackground(15);
				        TextColor(cyan+ Blink);
				        writeln('');
       				end

		        else If (lowercase(Data[pass].AreaParkir) = 'd1') or (lowercase(Data[pass].AreaParkir) = 'd2') or (lowercase(Data[pass].AreaParkir) = 'd3')
					 or (lowercase(Data[pass].AreaParkir) = 'd4') or (lowercase(Data[pass].AreaParkir) = 'd5') or (lowercase(Data[pass].AreaParkir) = 'd6')
					 or (lowercase(Data[pass].AreaParkir) = 'd7') or (lowercase(Data[pass].AreaParkir) = 'd8') or (lowercase(Data[pass].AreaParkir) = 'd9')
					 or (lowercase(Data[pass].AreaParkir) = 'd0') then

					begin
						TextBackground(11);
						TextColor(white + blink);
						write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
										Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'       ',Data[pass].Durasi,' jam         ');
						TextBackground(15);
				        TextColor(cyan+ Blink);
				        writeln('');
			        end 

		        else If (lowercase(Data[pass].AreaParkir) = 'e1') or (lowercase(Data[pass].AreaParkir) = 'e2') or (lowercase(Data[pass].AreaParkir) = 'e3')
					 or (lowercase(Data[pass].AreaParkir) = 'e4') or (lowercase(Data[pass].AreaParkir) = 'e5') or (lowercase(Data[pass].AreaParkir) = 'e6')
					 or (lowercase(Data[pass].AreaParkir) = 'e7') or (lowercase(Data[pass].AreaParkir) = 'e8') or (lowercase(Data[pass].AreaParkir) = 'e9')
					 or (lowercase(Data[pass].AreaParkir) = 'e0') then

					begin
						TextBackground(blue);
						TextColor(white + blink);
						write('         ',Data[pass].NomorMobil,'           ',Data[pass].JenisMobil,'           ',
										Data[pass].AreaParkir,' ',Data[pass].AreaParkir2,'       ',Data[pass].Durasi,' jam         ');
						TextBackground(15);
				        TextColor(cyan+ Blink);
				        writeln('');
			        end
			end;
		writeln(' --------------------------------------------------------------------');
		READLN;
	end;

procedure SortingBiaya();{Bubble Ascending}
 
	var
  	pass ,check : integer;
  	temp : DataUser;
 		
 		begin
  			for pass := 1 to idx-1 do
  				begin
   				for check := 1 to idx do
   					begin
    					if (Data[check].Biaya < (Data[check+1].Biaya)) then
     						begin
				     	     	temp            := Data[check];
				   				Data[check] := Data[check+1];
				   				Data[check+1]    := temp;
  							end;
  					end;
  				end;
 		end;

procedure SortingAreaParkir(); {Insertion Ascending}

	var
	  	pass, check : integer;
	  	temp : DataUser;
	 		
	 		begin
	  			for  pass := 1 to idx-1 do
	  			begin
			   		 check := pass + 1;
			   		 temp := Data[check];
	   					while (check >1) and (Data[check-1].AreaParkir > temp.AreaParkir) do
	   						begin
				   		   		Data[check] := Data[check-1];
				   		   		check := check -1;
	   						end;
	   				Data[Check] := temp;	
	  			end;
	  		end;

procedure Menu4();

	 var
        pilih:char;
     begin

      repeat;
	    clrscr;
        gotoxy(8,3);writeln('  ============================================================== ');
        gotoxy(8,4);writeln(' |                                                              | ');
        gotoxy(8,5);writeln(' |------------------------ EMERALD PARKING ---------------------| ');
        gotoxy(8,6);writeln(' |                                                              | ');
        gotoxy(8,7);writeln('  --------------------------------------------------------------  ');
        gotoxy(8,8);writeln(' |                                                              | ');
        gotoxy(8,9);writeln(' |                                                              | ');
	    gotoxy(8,10);writeln(' |   1. Data User Berdasarkan Nomor Mobil                       |');  
	    gotoxy(8,11);writeln(' |                                                              | ');
	    gotoxy(8,12);writeln(' |   2. Data User Berdasarkan Area Parkir                       |');
	    gotoxy(8,13);writeln(' |                                                              | ');
        gotoxy(8,14);writeln(' |   3. Data User Berdasarkan Durasi Parkir                     |');
        gotoxy(8,15);writeln(' |                                                              | ');
        gotoxy(8,16);writeln(' |   4. Data User Beradasarkan Jenis Mobil                      |');
        gotoxy(8,17);writeln(' |                                                              | ');
        gotoxy(8,18);writeln(' |   5. Data User Berdasarkan Biaya                             |');
        gotoxy(8,19);writeln(' |                                                              | ');
        gotoxy(8,20);writeln(' |   0. Menu Utama                                              |');
        gotoxy(8,21);writeln(' |                                                              | ');
        gotoxy(8,22);writeln('  ==============================================================');
		write('                                                    Pilih : ');
        readln(pilih);

        begin

	        if pilih = '1' then
	         begin
	                clrscr;
	                SortingNomorMobil;
	                ViewNomorMobil;
	         end

	        else if pilih = '2' then
	         begin
	                clrscr;
	                SortingAreaParkir;
	                ViewNomorMobil;
	         end

	        else if pilih = '3' then
	         begin
	                clrscr;
	                SortingDurasiParkir;
	                
	                ViewDurasi;
	          end

	        else if pilih = '4' then
	         begin
	                clrscr;
	                SortingJenisMobil;
	                ViewNomorMobil;
	         end

	        else if pilih = '5' then
	         begin
	                clrscr;
	                SortingBiaya;
	                ViewBiaya;
	         end;
	     end;
	  until (pilih = '0');
	 end;

procedure Menu3();

	 var
        pilih:char;
        nomor : integer;
	    
	    begin

	      repeat;
		    clrscr;
	        gotoxy(8,3);writeln('  ============================================================== ');
	        gotoxy(8,4);writeln(' |                                                              | ');
	        gotoxy(8,5);writeln(' |------------------------ EMERALD PARKING ---------------------| ');
	        gotoxy(8,6);writeln(' |                                                              | ');
	        gotoxy(8,7);writeln('  --------------------------------------------------------------  ');
	        gotoxy(8,8);writeln(' |                                                              | ');
	        gotoxy(8,9);writeln(' |                                                              | ');
		    gotoxy(8,10);writeln(' |   1. Check Data                                              |');  
		    gotoxy(8,11);writeln(' |                                                              | ');
		    gotoxy(8,12);writeln(' |   2. Edit Data                                               |');
		    gotoxy(8,13);writeln(' |                                                              | ');
	        gotoxy(8,14);writeln(' |   3. Search Data                                             |');
	        gotoxy(8,15);writeln(' |                                                              | ');
	        gotoxy(8,16);writeln(' |   4. Delete Data                                             |');
	        gotoxy(8,17);writeln(' |                                                              | ');
	        gotoxy(8,18);writeln(' |   0. Menu Utama                                              |');
	        gotoxy(8,19);writeln(' |                                                              | ');
	        gotoxy(8,20);writeln('  ==============================================================');
			write('                                                    Pilih : ');
	        readln(pilih);

			        begin
			        		if pilih = '1' then
			        			 begin
			              		  clrscr;
			       				  Menu4;
			        			 end

			       			 else if pilih = '2' then
			              		 begin
									     clrscr;
									     SortingNomorMobil;
									     TextBackground(red);
			                             TextColor(white+ Blink);
			                             gotoxy(23,12);write(' NOMOR MOBIL : ');
			                             readln(nomor);
			                                            while nomor > idx do
										              		begin
												              	TextBackground(15);
												                TextColor(cyan+ Blink);
												              	clrscr;
												              	TextBackground(red);
																TextColor(white+ Blink);
												                gotoxy(20,12);write(' MAAF BELUM ADA DATA UNTUK MOBIL TERSEBUT ');
												                cursoroff;
												     			delay(2000);
												                TextBackground(15);
												                TextColor(cyan+ Blink);
												                SortingNomorMobil;
												   				TextBackground(15);
												                TextColor(cyan+ Blink);
												                clrscr;
												                TextBackground(red);
																TextColor(white+ Blink);
												                gotoxy(23,12);write(' NOMOR MOBIL : ');
												              	readln(nomor);
										          			end;

										  TextBackground(15);
										  TextColor(cyan+ Blink);
			                           	  clrscr;
			                              TextBackground(red);
			                 			  TextColor(white+ Blink);
			                              gotoxy(23,12);write(' MASUKKAN AREA PARKIR YANG BARU : ');
			                              Data[idx].AreaParkir2 := '  ';

			                                            iF lowercase(Data[nomor].JenisMobil) = 'mobil kecil' then
			                            					begin	
			                            						readln(Data[nomor].AreaParkir);
			                            						TextBackground(15);
			                            		                TextColor(cyan+ Blink);
			                            					end;
			                            				If (lowercase(Data[nomor].JenisMobil) = 'mobil besar') then
			                            					begin
			                            						readln(Data[nomor].AreaParkir);
			                            						gotoxy(60,12);write(' ');readln(Data[nomor].AreaParkir2);
			                                                    TextBackground(15);
			                            		                TextColor(cyan+ Blink);
			                            		      		  end;
			      		         end
			      		         
							 else if pilih = '3' then
						    
									    begin 
							         		SortingNomorMobil;
							   				TextBackground(15);
							                TextColor(cyan+ Blink);
							                clrscr;
							                TextBackground(red);
											TextColor(white+ Blink);
							                gotoxy(23,12);write(' NOMOR MOBIL : ');
							              	readln(nomor);
							              		while nomor > idx do
									              	begin
										              	TextBackground(15);
										                TextColor(cyan+ Blink);
										              	clrscr;
										              	TextBackground(red);
														TextColor(white+ Blink);
										                gotoxy(20,12);write(' MAAF BELUM ADA DATA UNTUK MOBIL TERSEBUT ');
										                cursoroff;
										     			delay(2000);
										                TextBackground(15);
										                TextColor(cyan+ Blink);
										                SortingNomorMobil;
										   				TextBackground(15);
										                TextColor(cyan+ Blink);
										                clrscr;
										                TextBackground(red);
														TextColor(white+ Blink);
										                gotoxy(23,12);write(' NOMOR MOBIL : ');
										              	readln(nomor);
										              	TextBackground(15);
										                TextColor(cyan+ Blink);
									          		end;
									         TextBackground(15);
										     TextColor(cyan+ Blink);
											 clrscr;
									        	for x:= 0 to 100 do
										        	begin
												        gotoxy(21,13);
												        delay(60);
												        gotoxy(18,13);
												        cursoroff;
												        write('DATA DENGAN NOMOR MOBIL : ',nomor,' SEDANG DICARI = ',x,'%');
										      	  	end;
									        clrScr;
									        cursorOff;
										        If (lowercase(Data[nomor].AreaParkir) = 'a1') or (lowercase(Data[nomor].AreaParkir) = 'a2') or (lowercase(Data[nomor].AreaParkir) = 'a3')
												or (lowercase(Data[nomor].AreaParkir) = 'a4') or (lowercase(Data[nomor].AreaParkir) = 'a5') or (lowercase(Data[nomor].AreaParkir) = 'a6')
												or (lowercase(Data[nomor].AreaParkir) = 'a7') or (lowercase(Data[nomor].AreaParkir) = 'a8') or (lowercase(Data[nomor].AreaParkir) = 'a9')
												or (lowercase(Data[nomor].AreaParkir) = 'a0') then

													begin
														TextBackground(red);
														TextColor(white + blink);
														clrscr;
												        writeln('');
												       	gotoxy(32,9);writeln('EMERALD PARKING');
														writeln(' ');
														gotoxy(27,12);writeln('NOMOR MOBIL : ',Data[nomor].NomorMobil);
														gotoxy(27,13);writeln('JENIS MOBIL : ',Data[nomor].JenisMobil);
														gotoxy(27,14);writeln('JAM MASUK   : ',Data[nomor].JamMasuk);
														gotoxy(27,15);writeln('AREA PARKIR : ',Data[nomor].AreaParkir,' ',Data[nomor].AreaParkir2);
														Delay(5000);
														TextBackground(15);
												        TextColor(cyan+ Blink);
											        end

										        else If (lowercase(Data[nomor].AreaParkir) = 'b1') or (lowercase(Data[nomor].AreaParkir) = 'b2') or (lowercase(Data[nomor].AreaParkir) = 'b3')
													 or (lowercase(Data[nomor].AreaParkir) = 'b4') or (lowercase(Data[nomor].AreaParkir) = 'b5') or (lowercase(Data[nomor].AreaParkir) = 'b6')
													 or (lowercase(Data[nomor].AreaParkir) = 'b7') or (lowercase(Data[nomor].AreaParkir) = 'b8') or (lowercase(Data[nomor].AreaParkir) = 'b9')
													 or (lowercase(Data[nomor].AreaParkir) = 'b0') then

													begin
														TextBackground(yellow);
														TextColor(white + blink);
														clrscr;
												        writeln('');
												       	gotoxy(32,9);writeln('EMERALD PARKING');
														writeln(' ');
														gotoxy(27,12);writeln('NOMOR MOBIL : ',Data[nomor].NomorMobil);
														gotoxy(27,13);writeln('JENIS MOBIL : ',Data[nomor].JenisMobil);
														gotoxy(27,14);writeln('JAM MASUK   : ',Data[nomor].JamMasuk);
														gotoxy(27,15);writeln('AREA PARKIR : ',Data[nomor].AreaParkir,' ',Data[nomor].AreaParkir2);
														Delay(5000);
														TextBackground(15);
												        TextColor(cyan+ Blink);
											        end

										        else If (lowercase(Data[nomor].AreaParkir) = 'c1') or (lowercase(Data[nomor].AreaParkir) = 'c2') or (lowercase(Data[nomor].AreaParkir) = 'c3')
													 or (lowercase(Data[nomor].AreaParkir) = 'c4') or (lowercase(Data[nomor].AreaParkir) = 'c5') or (lowercase(Data[nomor].AreaParkir) = 'c6')
													 or (lowercase(Data[nomor].AreaParkir) = 'c7') or (lowercase(Data[nomor].AreaParkir) = 'c8') or (lowercase(Data[nomor].AreaParkir) = 'c9')
													 or (lowercase(Data[nomor].AreaParkir) = 'c0') then

													begin
														TextBackground(green);
														TextColor(white + blink);
														clrscr;
												        writeln('');
												       	gotoxy(32,9);writeln('EMERALD PARKING');
														writeln(' ');
														gotoxy(27,12);writeln('NOMOR MOBIL : ',Data[nomor].NomorMobil);
														gotoxy(27,13);writeln('JENIS MOBIL : ',Data[nomor].JenisMobil);
														gotoxy(27,14);writeln('JAM MASUK   : ',Data[nomor].JamMasuk);
														gotoxy(27,15);writeln('AREA PARKIR : ',Data[nomor].AreaParkir,' ',Data[nomor].AreaParkir2);
														Delay(5000);
														TextBackground(15);
												        TextColor(cyan+ Blink);
											        end

										        else If (lowercase(Data[nomor].AreaParkir) = 'd1') or (lowercase(Data[nomor].AreaParkir) = 'd2') or (lowercase(Data[nomor].AreaParkir) = 'd3')
													 or (lowercase(Data[nomor].AreaParkir) = 'd4') or (lowercase(Data[nomor].AreaParkir) = 'd5') or (lowercase(Data[nomor].AreaParkir) = 'd6')
													 or (lowercase(Data[nomor].AreaParkir) = 'd7') or (lowercase(Data[nomor].AreaParkir) = 'd8') or (lowercase(Data[nomor].AreaParkir) = 'd9')
													 or (lowercase(Data[nomor].AreaParkir) = 'd0') then

														begin
															TextBackground(11);
															TextColor(white + blink);
															clrscr;
													        writeln('');
													       	gotoxy(32,9);writeln('EMERALD PARKING');
															writeln(' ');
															gotoxy(27,12);writeln('NOMOR MOBIL : ',Data[nomor].NomorMobil);
															gotoxy(27,13);writeln('JENIS MOBIL : ',Data[nomor].JenisMobil);
															gotoxy(27,14);writeln('JAM MASUK   : ',Data[nomor].JamMasuk);
															gotoxy(27,15);writeln('AREA PARKIR : ',Data[nomor].AreaParkir,' ',Data[nomor].AreaParkir2);
															Delay(5000);
															TextBackground(15);
													        TextColor(cyan+ Blink);
												        end

										        else If (lowercase(Data[nomor].AreaParkir) = 'e1') or (lowercase(Data[nomor].AreaParkir) = 'e2') or (lowercase(Data[nomor].AreaParkir) = 'e3')
													 or (lowercase(Data[nomor].AreaParkir) = 'e4') or (lowercase(Data[nomor].AreaParkir) = 'e5') or (lowercase(Data[nomor].AreaParkir) = 'e6')
													 or (lowercase(Data[nomor].AreaParkir) = 'e7') or (lowercase(Data[nomor].AreaParkir) = 'e8') or (lowercase(Data[nomor].AreaParkir) = 'e9')
													 or (lowercase(Data[nomor].AreaParkir) = 'e0') then

														begin
															TextBackground(blue);
															TextColor(white + blink);
															clrscr;
													        writeln('');
													       	gotoxy(32,9);writeln('EMERALD PARKING');
															writeln(' ');
															gotoxy(27,12);writeln('NOMOR MOBIL : ',Data[nomor].NomorMobil);
															gotoxy(27,13);writeln('JENIS MOBIL : ',Data[nomor].JenisMobil);
															gotoxy(27,14);writeln('JAM MASUK   : ',Data[nomor].JamMasuk);
															gotoxy(27,15);writeln('AREA PARKIR : ',Data[nomor].AreaParkiR,' ',Data[nomor].AreaParkir2);
															Delay(5000);
															TextBackground(15);
													        TextColor(cyan+ Blink);
												        end;
							  			end

			           		 else if pilih = '4' then

			                    begin
			              			   SortingNomorMobil;
			                           clrscr;
			                           TextBackground(red);
			           				   TextColor(white+ Blink);
			                           gotoxy(23,12);write(' NOMOR MOBIL : ');
			                           readln(nomor);
			                           Data[nomor].AreaParkir := '';
			           				   Data[nomor].JenisMobil := '';
			           				   Data[nomor].JamMasuk   := 0;
			           				   Data[nomor].JamKeluar  := 0;
			           				   Data[nomor].Biaya 	 := 0;
			           				   Data[nomor].Durasi 	 := 0;
			           				   TextBackground(15);
			                           TextColor(cyan+ Blink);
			                           ;
			                    end;
			      				end;
	       until (pilih = '0');
	    end;
	 
procedure eraseDAT();
	var
		check : integer;
		tes   : String;
	begin
						TextBackground(15);
                        TextColor(Red+ Blink);
                        clrscr;
                        writeln(' ');
                        TextBackground(red);
						TextColor(white+ Blink);
                        gotoxy(18,12);write(' APA ANDA YAKIN INGIN MERESET DATA (YES/NO) : ');
                        readln(tes);
                      	  If lowercase(tes) = 'yes' then
                        	begin
								for check := 1 to idx do
									begin
										data[check].NomorMobil := 0;
										data[check].biaya := 0;
										data[check].Durasi := 0;
									end;
								IDX := 0;
								I:= 0;
								TextBackground(15);
                       			 TextColor(cyan+ Blink);
							end
						  else
							TextBackground(15);
	                        TextColor(cyan+ Blink);
							menuutama;
	                        TextBackground(15);
	                        TextColor(cyan+ Blink);
	                        CursorOff;
	                        Delay(3000);
	                        CursorOn;
	end;

procedure readDAT();

	var check : integer;

	begin
		Reset(FileDataUser);
        Reset(FileI);
		Reset(FileX);
		Reset(FileIDX);
		read(FileIDX,idx);
			for check := 1 to idx do
				read(FileDataUser,Data[check]);
    			read(FileI,i);
    			read(FileX,x);
    	    	clrscr;
	end;

procedure MenuUtama;
 var
        pilih:char;

 begin
		repeat;
			clrscr;
	        gotoxy(8,4);writeln('  ============================================================== ');
	        gotoxy(8,5);writeln(' |                                                              | ');
	        gotoxy(8,6);writeln(' |------------------------ EMERALD PARKING ---------------------| ');
	        gotoxy(8,7);writeln(' |                                                              | ');
	        gotoxy(8,8);writeln('  --------------------------------------------------------------  ');
	        gotoxy(8,9);writeln(' |                                                              | ');
	        gotoxy(8,10);writeln(' |                                                              | ');
			gotoxy(8,11);writeln(' |   1. Cek Area Parkir                                         |');
			gotoxy(8,12);writeln(' |                                                              | ');
			gotoxy(8,13);writeln(' |   2. Pembelian Tiket Parkir                                  |');
			gotoxy(8,14);writeln(' |                                                              | ');
	        gotoxy(8,15);writeln(' |   3. Mobil Keluar                                            |');
	        gotoxy(8,16);writeln(' |                                                              | ');
	        gotoxy(8,17);writeln(' |   4. Cek Data User                                           |');
	        gotoxy(8,18);writeln(' |                                                              | ');
	        gotoxy(8,19);writeln(' |   5. Reset Data                                              |');
	        gotoxy(8,20);writeln(' |                                                              | ');
	        gotoxy(8,21);writeln(' |   0. Exit                                                    |');
	        gotoxy(8,22);writeln(' |                                                              | ');
	        gotoxy(8,23);writeln('  ==============================================================');
			write('                                                    Pilih : ');
	        readln(pilih);
		        if pilih = '1' then
		         	begin
		                clrscr;
			                CekAreaParkir;
			                readln;
			         end

		        else if pilih = '2' then
			         begin
			                clrscr;
			                PembelianTiketParkir;CetakKartu;
			         end

		        else if pilih = '3' then
			         begin
			                clrscr;
			                MenuKeluar;
			         end

		         else if pilih = '4' then
			         begin
			                clrscr;
			                Menu3;
			         end

		         else if pilih = '5' then
			         begin
			                clrscr;

			               eraseDAT;
			            
			         end;
		until (pilih = '0');
 end;

procedure  LoadingAwal();
	
	begin
				clrscr;
                writeln('');
                gotoxy(10,11);writeln('==============================================================');
                gotoxy(10,12);writeln('----------------- WELCOME TO EMERALD PARKING -----------------');
                gotoxy(10,13);writeln('==============================================================');
                CursorOff;
                Delay(3500);
                clrscr;
                CursorOn;
    end;

procedure Tampilan();
       
	begin
			TextBackground(15);
        	TextColor(cyan+ Blink);
    end;

begin       	
			idx := 0;
		    Tampilan;
			clrscr;
			Assign(FileDataUser,'DataUser.DAT');
			Assign(FileI,'I.DAT');
			Assign(FileX,'X.DAT');
			Assign(FileIDX,'IDX.DAT');

			LoadingAwal;

			if fileexists('DataUser.DAT') then 

				readDAT

			else 
				begin
					Rewrite(FileDataUser);
					Rewrite(FileI);
				    Rewrite(FileX);
				    Rewrite(FileIDX);
			    end;

			MenuUtama;

		    Reset(FileDataUser);
		    Reset(FileI);
			Reset(FileX);
			Reset(FileIDX);

			for check := 1 to idx do
		
		   		 write(FileDataUser,Data[check]);
		    	 write(FileI,i);
		    	 write(FileX,x);
		    	 write(FileIDX,idx);

			 	 close(FileDataUser);
		   	 	 close(FileI);
		   		 close(FileX);
		   		 close(FileIDX); 	
		readkey;
end.
