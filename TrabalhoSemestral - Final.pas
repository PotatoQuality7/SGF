Program TrabalhoSemestral;
uses crt;
var 
    nome, codigo, senha, cargo, datanascimento, datainicio, email : array[1..10000] of string;
    chefe : array[1..1000] of string;
    sexo : array[1..10000] of char;
		(*Despesas*) 
		saude, alimentacao, escola, vestuario, capricho, lazer, poupanca, resto, total : array[1..10000,1..12]of real;
		feito : array[1..10000,1..12] of boolean;
		(*        *)                             
		salario : array[1..10000] of real;
		departamentos, acronimo : array[1..1000] of string;
		espaco, espfunc : array[1..6] of string;
		count, cont, con, id, temp, temp4, t, numdep, numfunc, e : integer;
		conta, temp2, temp3, resposta, resp, mensagem, letra  : string;
		bemvindo, invalido, relatorio2, encontrado, procura : boolean;  
    dep, nom1, nom2, cargo1, cargo2, em1, em2 : string;
    
Procedure  Menu; forward;
Procedure  Relatorio; forward;
Procedure VisitaDepartamentos; forward;
Procedure Display; forward;

Procedure LetrasMinusculas; //Essa procedimento faz com que todas letras do array departamentos[count] sejam min�sculas.

Begin

temp3 := '';
for cont := 1 to length(temp2) do 
	begin                                           
		for con := 32 to 167 do
			begin
				letra := copy(temp2,cont,1); //Vari�vel letra armazena 1 caractere de cada vez.
				if letra = chr(con) then
				   begin
							if (con >= 65)AND(con <= 90) then
								 temp3 := temp3 + chr(con + 32)  //Se a letra for maiuscula, ent�o passar� a ser min�scula.
							 else
								 temp3 := temp3 + chr(con);    
					 end;
			end;              
	end;      
	temp2 := temp3;                 
End;												

Procedure Iniciais; //Esse procedimento serve para formatar a posi��o corrente de um array para que somente as letras iniciais sejam mai�sculas.

Begin
 
 for cont := 1 to length(temp2) do
	begin
		if copy(temp2,cont,1) = ' ' then
			begin
			  if (copy(temp2,cont+1,2) <> 'e ')AND(copy(temp2,cont+1,3) <> 'da ')AND(copy(temp2,cont+1,3) <> 'de ')AND(copy(temp2,cont+1,3) <> 'do ')AND(copy(temp2,cont+1,4) <> 'das ')AND(copy(temp2,cont+1,4) <> 'dos ') then //Todas letras vindo depois de um espa�o ficam mai�sculas, excepto as proposi��es.
				  	temp2 := copy(temp2,1,cont) + upcase(copy(temp2,cont+1,1)) + copy(temp2,cont+2,length(temp2));
	    end
		 else
	     if cont = 1 then
	        temp2 := upcase(copy(temp2,1,1)) + copy(temp2,2,length(temp2)-1); //Torna a primeira letra mai�scula.
	end;
End;

Procedure FormatarNome; //Procedimento que vai formatar o nome para que esteja na forma Aaaa Bbbb. Exemplo: Berto Timana e n�o bErto TImAna. 

Begin

repeat
  read(temp2);
  for cont := 1 to length(temp2) do
    begin
      val(copy(temp2,cont,1),temp4,e);
      if e <> 1 then   //A vari�vel de erro, "e" s� ser� 1 quando a fun��o val n�o conseguuir converter o string para um n�mero. 
       begin           //Ent�o se "e" n�o for 1, quer dizer que o caractere que est� a ser analisado � um n�mero, e sabemos que um nome n�o pode ter n�meros.
          writeln('Use apenas letras.');
          break;
			 end;   
		end; 
until e = 1;	 
LetrasMinusculas;
Iniciais;

End;				

Procedure Data;

Begin

 repeat 
   ClrScr;
   writeln(mensagem);
   writeln;
   invalido := false;
	 temp3 := '';
	 writeln('Dia?');
	 read(temp);
	 while (temp < 1)OR(temp > 31) do
		 begin
	     writeln('Dia invalido.');
		   read(temp);	 
	   end;
   str(temp,temp2);
   if length(temp2) = 1 then
	    temp3 := temp3 + '0' + temp2 + '-'
	  else  
	    temp3 := temp3 + temp2 + '-';
   ClrScr;
   writeln('Mes?');
   read(temp);
   while (temp < 1)OR(temp > 12) do
	   begin
	     writeln('Mes invalido.');
		   read(temp);	 
	   end;  
   str(temp,temp2);
   if length(temp2) = 1 then
	    temp3 := temp3 + '0' + temp2 + '-'
	  else  
	    temp3 := temp3 + temp2 + '-';
   if copy(temp3,1,2) = '31' then
      case temp of
		    2,4,6,9,11 : invalido := true;
		  end; 
   ClrScr;
   if invalido = false then
	   begin
		   writeln('Ano?');  	 	 
  		 repeat
	  	   read(temp);
	  	   if (temp > 2021)OR(temp < 1900) then
	  	      writeln('Data invalida.')
	  	    else                  
	    	    if (temp >= 2004)AND(mensagem <> 'Qual foi a data de inicio do trabalho desse funcionario?') then
					  	  writeln('Jovem demais.')
						 else
							 if temp < 1940 then
						   	  writeln('Velho demais.');  	 
	  	 until (temp > 1940)AND((mensagem = 'Qual foi a data de inicio do trabalho desse funcionario?')OR(temp < 2004));
  		 str(temp,temp2);
  		 temp3 := temp3 + temp2;
  		 if (copy(temp3,1,2) = '29')AND(copy(temp3,4,2) = '02')AND(temp MOD 4 <> 0) then
		  	 	invalido := true;
	   end;
	 ClrScr;  
	 if invalido = true then
	   begin
	    if copy(temp3,length(temp3),1) = '-' then
	       writeln(copy(temp3,1,length(temp3)-1))
	     else
			   writeln(temp3);  
		  writeln('Data invalida.');
		  delay(3300);
		 end;		 
 until invalido = false;  
                             	
End;

Procedure MudarSenha;

Begin

ClrScr;
writeln('Senha antiga: ',senha[id]);
writeln;
writeln('Escreva a sua nova senha.');
read(temp2);
ClrScr;
writeln('A sua nova senha sera "',temp2,'". Confirmar? (s = sim, n = nao)');
resposta := upcase(readkey);
repeat
  invalido := false;
	if resposta = 'N' then
  begin
	  ClrScr;
		writeln('Pedido cancelado.');
		delay(2500);
	end
 else
   if resposta = 'S' then		
     begin
		   ClrScr;
		   senha[id] := temp2;
			 writeln('Senha mudada com sucesso.');
			 delay(2500);
		 end
		else	
			begin
			  writeln('Resposta invalida.');
			  invalido := true;
			end;
until invalido = false;
VisitaDepartamentos;
			  
End;

Procedure Contas;

Var

cod, sen : string; //Variaveis que v�o armazenar o c�digo e a senha.

Begin

textcolor(15);
if bemvindo = false then
  begin
	  mensagem := 'Bem-vindo ao programa de Gestao de Despesas da UEM!';
		writeln;
		for count := 1 to length(mensagem) do
      begin
        write(copy(mensagem,count,1));
        delay(10);
      end;
    delay(2500);  
	end;
bemvindo := true;
ClrScr;             
temp2 := '';
temp3 := '';
repeat 
   repeat
	 espaco[1] := '                    ';
   espaco[2] := '                    ';
   writeln('Introduz o seu codigo de funcionario.');
   read(cod);
   temp2 := cod;
   writeln('Introduz a sua senha.');
   read(sen);
   temp3 := '';
   for count := 1 to length(sen) do
	   begin
		    temp3 := temp3 + '*';
		 end;
   for count := 1 to length(cod) do
		 begin
				if espaco[1] = '' then
				  begin
					  temp2 := copy(temp2,1,length(temp2)-3) + '...';
					  break;
					end;  
				espaco[1] := copy(espaco[1],1,length(espaco[1])-1);
		 end;
	 for count := 1 to length(sen) do
		 begin
		   if espaco[2] = '' then
				  begin
					  temp3 := copy(temp3,1,length(temp3)-3) + '...';
					  break;
					end;
		   espaco[2] := copy(espaco[2],1,length(espaco[2])-1); 
		 end;
	 ClrScr;
   writeln('                                                Login');
	 writeln('_____________________________________________________________________________________________________________');   
	 writeln;
	 writeln;
	 writeln;
	 writeln('           Codigo de funcionario                                      Senha                  ');
	 writeln('          .---------------------.                                   .---------------------.');
	 write('          | ');textcolor(11);write(temp2,espaco[1]);textcolor(15);write('|                                   | ');textcolor(11);write(temp3,espaco[2]);textcolor(15);writeln('|');
	 writeln('          |_____________________|                                   |_____________________|');
	 writeln;
	 writeln;
	 writeln;
	 writeln;
	 writeln;
	 writeln;
	 writeln;
	 writeln;
	 writeln;
	 writeln;
	 writeln;
	 writeln;
	 writeln;
	 writeln;
	 writeln;   
	 writeln('Confirmar? (s = sim, n = nao)');
	 resposta := upcase(readkey);
	 ClrScr;
   until resposta = 'S';
	 for count := 1 to 3 do;
     begin
	  	 writeln('Por favor aguarde enquanto procuramos a sua conta...');
	  	 delay(1400);
	  	 ClrScr;
	  	 writeln('Por favor aguarde enquanto procuramos a sua conta..');
	  	 delay(1400);
	  	 ClrScr;
		 end;
	 if (cod = 'Gerente')AND(sen = 'Gerente123') then
	   begin                                 
				conta := 'gerente';                     
		    ClrScr;
		    writeln('Conta encontrada com sucesso.'); 
		    delay(2500);
		    Menu;
		 end
		else
		  begin
			  if numfunc >= 1 then
				  for count := 1 to numfunc do
			      begin
			        if cod = codigo[count] then     //O procurar o c�digo e vai ver se a senha nessa mesma posi��o do vetor codigo � a mesmo que a senha introoduzida no vetor de senha.
			           if sen = senha[count] then   //Exemplo: cod = 'DMI5200' e codigo[65] = 'DMI5200', logo cod = codigo[65]. Agora vamos ser se a vari�vel sen � igual a senha[65]. Se for, a conta vai abrir. Outrocaso, n�o.
			             begin                                
									   conta := 'funcionario';
		    						 ClrScr;
		    						 writeln('Conta encontrada com sucesso.'); 
		    						 delay(2500);
		    						 id := count; 
		    						 Display;
		    						 break;
			             end;
			      end       
			     else
						 writeln('Conta nao encontrada. Tente novamente.');
			end;  	
until (conta = 'gerente')OR(conta = 'funcionario');		
		
End;


Procedure CadastroDepartamento;
   
Begin

 ClrScr;
 if numdep = 0 then
	 begin
	   writeln('Quantos departamentos tem a UEM?');
		 read(temp);
		 t := 1; 
	 end
	else
		begin
		  writeln('Adicionar mais quantos departamentos?');	  
		  read(temp);
	    t := numdep+1;
	    temp := temp + numdep;
		end;;
 if temp = 0 then
    Menu;		 	  
 ClrScr;	
 for count := t to temp do
	 begin		        
	   writeln('Qual e o nome do ',count,'� departamento?');
	   repeat
	     invalido := false;
		   read(departamentos[count]);                          
	   	 while length(departamentos[count]) = 1 do
	       begin
	         writeln('Nome curto demais.');
	         read(departamentos[count]);
			   end;
		   temp2 := departamentos[count]; 
		   LetrasMinusculas;                 								
		   departamentos[count] := temp2; 
		   if copy(temp2,1,12) <> 'departamento' then  //Chamamos o procedimento LetrasMinusculas para evitar casos em que o usu�rio escreva algo como "dEpARtamentO" ou "departamentO" e o nosso programa n�o reconhe�a como "departamento", por consequ�ncia, iria escrever "Departamento de dEpARtamentO..." ao inv�s de "Departamento de..".
		      departamentos[count] := 'Departamento de ' + departamentos[count]; 
		   temp2 := departamentos[count];
		   Iniciais;
		   departamentos[count] := temp2; 				    
		   if numdep > 1 then
			   for cont := 1 to numdep do
			     begin
			        if (departamentos[count] = departamentos[cont])AND(count <> cont) then
			          begin
			            writeln('Esse departamento ja foi cadastrado.');
			            delay(2500);
			            invalido := true;
			            break;
								end;  
			     end;
			 ClrScr;
	   until invalido = false;
		 writeln('Qual e o acronimo do ',departamentos[count],'?');
	   read(acronimo[count]);
	   acronimo[count] := upcase(acronimo[count]);
		 invalido := true;
		 while invalido = true do
		   begin                          
			   invalido := false;
				 for cont := 1 to count do
	         begin
	           if count <> cont then
								if acronimo[count] = acronimo[cont] then
									begin
									  ClrScr;
										writeln(acronimo[count]);
										writeln('Esse acronimo ja esta a ser usado. Tente outro.');
										invalido := true;
										read(acronimo[count]);
								  end;;
					 end;				   
	     end;
	   acronimo[count] := upcase(acronimo[count]);	           	           
		 ClrScr;
		 inc(numdep);
	   writeln('Qual e o nome do chefe do ',departamentos[count],'?');
	   FormatarNome;
		 chefe[count] := temp2;
		 ClrScr;
	 end;
	 mensagem := 'Departamentos cadastrados com sucesso.';
 	 for count := 1 to length(mensagem) do
		 begin
		   write(copy(mensagem,count,1));
		   delay(8);
		 end;
	 delay(2000);
	 Menu;  
	 
End;

Procedure Display;

Begin
          espaco[1] := '                                                                 ';
			  	 if conta = 'gerente' then
					    temp2 := 'Funcionario - ' + nome[id]
					  else
					    temp2 := 'Minha conta - ' + departamentos[id];
					 writeln;        
					 for count := 1 to length(temp2) do
				     begin
					  	 espaco[1] := copy(espaco[1],1,length(espaco[1])-1);
						 end;  
    			 writeln(espaco[1],temp2);
					 writeln('_____________________________________________________________________________________________________________');
			  	 writeln;  
			  	 writeln;                           
			  	 writeln;
			  	 writeln;
			     if relatorio2 = false then
            begin//Calculos de espa�amento autom�tico. Quanto mais longo o nome, cargo ou n�vel acad�mico for, mais curto o espa�amento ser�.
					    nom1 := nome[id];
					 		espfunc[1] := '                         ';  
			  	 		nom2 := '';
					 		espfunc[2] := '                         ';                    			 
					 		if length(nome[id]) > length(espfunc[1]) then  
					  		begin
						 			for count := length(nome[id]) downto 1 do
				  	 				begin
				    	 				 if (copy(nome[id],count,1) = ' ')AND(count-1 <= length(espfunc[1])) then
				      	 				begin
						    	 				nom1 := copy(nome[id],1,count-1); //Se o nome for longo demais para caber na primeira linha, o "excesso" passa para a segunda.
						    	 				nom2 := copy(nome[id],count+1,length(nome[id])-cont);
					      	 			  break;
								 			  end;
				  	 	      end; 
				        end;
					 		for count := 1 to length(nom1) do
				  	    begin
					 				espfunc[1] := copy(espfunc[1],1,length(espfunc[1])-1)
						    end;
			     		for count := 1 to length(nom2) do
						 	  begin
							    espfunc[2] := copy(espfunc[2],1,length(espfunc[2])-1); 
						    end;
					    cargo1 := cargo[id];
					 		espfunc[3] := '                        ';  
			  	 		cargo2 := '';
					 		espfunc[4] := '                        ';                    			    
					 		if length(cargo[id]) > length(espfunc[3]) then
				    		begin
						 		  for count := length(cargo[id]) downto 1 do
				  	 				begin
				    	 				 if (copy(cargo[id],count,1) = ' ')AND(count-1 <= length(espfunc[3])) then
				      	 				begin
						    	 				cargo1 := copy(cargo[id],1,count-1); //Se o cargo for longo demais para caber na primeira linha, o "excesso" passa para a segunda.
						    	 				cargo2 := copy(cargo[id],count+1,length(cargo[id])-count);
					      	 				break;
								 				end;
				  	 				end;
				  			end; 
					 		for count := 1 to length(cargo1) do
				  	 		begin
					 	   		espfunc[3] := copy(espfunc[3],1,length(espfunc[3])-1)
						 		end;
					 		for count := 1 to length(cargo2) do
						 		begin
							 		espfunc[4] := copy(espfunc[4],1,length(espfunc[4])-1); 
						 		end;
							em1 := email[id];	 					 
							espfunc[5] := '                      '; 
							espfunc[6] := '                      ';
							if length(email[id]) > length(espfunc[5]) then
				    		begin
						 		  for count := length(cargo[id]) downto 1 do
				  	 				begin
				    	 				 if count-1 <= length(espfunc[5]) then
				      	 				begin
						    	 				em1 := copy(email[id],1,count-1); //Se o cargo for longo demais para caber na primeira linha, o "excesso" passa para a segunda.
						    	 				em2 := copy(email[id],count+1,length(email[id])-count);
					      	 				break;
								 				end;
				  	 				end;
				  			end;
				  			for count := 1 to length(em1) do
				  	 		begin
					 	   		espfunc[5] := copy(espfunc[5],1,length(espfunc[5])-1)
						 		end;
					 		for count := 1 to length(em2) do
						 		begin
							 		espfunc[6] := copy(espfunc[6],1,length(espfunc[6])-1); 
						 		end;
					 		//Esses c�lculos em cima servem para mostrar a informa��o abaixo de uma for agrad�vel, pois a estrutura toda estar� de uma forma fixa, independentemente do comprimento das palavras. 	
					 		writeln('   _________________________________');
			  	 		writeln('  |                                 |');
			  	 		write('  |');textcolor(11);write('              .  .               ');textcolor(15);writeln('|');
					 		write('  |');textcolor(11);write('            .      .             ');textcolor(15);writeln('|');
					 		write('  |');textcolor(11);write('           .        .            ');textcolor(15);writeln('|');
					 		write('  |');textcolor(11);write('           .        .            ');textcolor(15);writeln('|');
					 		write('  |');textcolor(11);write('            .      .             ');textcolor(15);writeln('|');
				   		write('  |');textcolor(11);write('             .    .              ');textcolor(15);writeln('|');
					 		write('  |');textcolor(11);write('           .        .            ');textcolor(15);writeln('|');
					 		write('  |');textcolor(11);write('        .              .         ');textcolor(15);writeln('|');
					 		write('  |');textcolor(11);write('       .                .        ');textcolor(15);writeln('|');
			  	 		write('  | Dados do Funcionario');textcolor(11);write('    .       ');textcolor(15);writeln('|');
			  	 		writeln('  |---------------------------------|');
			  	 		writeln('  | Nome: ',nom1,espfunc[1],' |');
			  	 		writeln('  |       ',nom2,espfunc[2],' |');
			  	 		writeln('  | Sexo: ',sexo[id],'                         |');
					 		writeln('  |                                 |');
					 		writeln('  | Data de nascimento: ',datanascimento[id],'  |');
					 		writeln('  |                                 |');
					 		writeln('  | Cargo: ',cargo1,espfunc[3],' |');
			  	 		writeln('  |        ',cargo2,espfunc[4],' |');
 			  	 		writeln('  | Data de inicio: ',datainicio[id],'      |');
			  	 		writeln('  |                                 |');
			  	 		writeln('  | E-mail : ',em1,espfunc[5],' |');
					 		writeln('  |          ',em2,espfunc[6],' |');
					 		writeln('  |_________________________________|');
			  	 		writeln;
			  	 		writeln;
			  	 		if conta = 'funcionario' then
							  begin
							    writeln('Aperte "d" para atualizar as suas despesas, "m" para mudar a senha, ou "s" para sair.');
							    repeat
							       invalido := false;
							       resposta := upcase(readkey);
							       if resposta = 'D' then
							          Relatorio
							        else
											  if resposta = 'M' then  
											     MudarSenha
											   else
												   if resposta = 'S' then
													    Contas
													  else
														  begin
															  writeln('Escolha invalida.');  
															  invalido := true;
															end; 															  
							    until invalido = false;
							  end
							 else
							 	 begin
									 writeln('Aperte "v" para voltar.');
			  	 				 resposta := upcase(readkey);
			  	 				 if resposta = 'V' then	
			    	  	 		 VisitaDepartamentos;
			    	  	 end;	
								 end;	 
			    	  	 
End;

Procedure CadastroFuncionario;
  
  Begin
  ClrScr;
  if numdep > 0 then
	 begin
	  textcolor(15);
		writeln;
		writeln('                                                DEPARTAMENTOS');
		writeln('_____________________________________________________________________________________________________________');
		writeln;
		writeln;
		writeln;
		for count := 1 to numdep do
		  begin
		    writeln(count,'. ',departamentos[count],' = ',acronimo[count]);
		  end;
		writeln;
		writeln('Escolha o departamento onde deseja cadastrar os funcionarios (1-',numdep,') ou aperte "v" para voltar.'); 
		read(resposta);
		val(resposta,t,e);
		resposta := upcase(resposta);                         //Usamos a fun��o upcase para evitar ter que dizer: se (resposta <> 'V')ou(resposta <> 'v'). Assim s� precisamos de uma condi��o para esses dois casos.
		while ((t < 1)OR(t > numdep))AND(resposta <> 'V') do  //Quanto mais condi��es involvedo caracteres, mais eficaz isso �.
		  begin
			  writeln('Escolha invalida. (1-',numdep,') ou "v" para voltar');
			  read(t);
			  str(t,resposta);
			end;
		if resposta = 'V' then
		   Menu;	 
		id := t;	
		ClrScr;	
		espaco[1] := '                                                    ';
		temp2 := departamentos[id] + ' - ' + chefe[id] + ' (Chefe)'; //Essa informa��o vai aparecer no cabe�alho.
		for count := 1 to (length(temp2) DIV 2) do
		  begin
				espaco[1] := copy(espaco[1],1,length(espaco[1])-1); //Quanto mais longo for o nome do departamento e do chefe, mais curto ser� o espa�amento.
		  end;  
		writeln;  
    writeln(espaco[1],temp2);
		writeln('_____________________________________________________________________________________________________________'); 
	 	writeln;
		writeln;
		writeln('Quantos funcionarios deseja cadastrar no ',departamentos[id],'?');
		writeln;
		read(t);
		while t < 0 do
		  begin
			  writeln('Resposta invalida.');
			  read(t);
			end;
		if t = 0 then
		  CadastroFuncionario;
		t := numfunc + t;			
	 for count := numfunc+1 to t do
	  begin 
	    ClrScr;
      write('Introduza o nome do funcionario: ');
		  FormatarNome;		 
		  nome[count] := temp2;
		  ClrScr;
		  write('Introduza o cargo do funcionario: ');
		  FormatarNome;
		  cargo[count] := temp2;
		  str((random(8999)+1000),temp2); //Nesta area um numero aleatorio sera gerado para o funcionario e armazenado na variavel temp2
		  codigo[count] := acronimo[id] + temp2; //O codigo do funcionario e criado a partir do acronimo do seu departamento e o numero gerado no passo anterior. eg. Nome do departamento : Departamento de Matematica e Informatica. Acronimo: DMI. Codigo de um funcionario neste departamento: DMI5200
		  senha[count] := codigo[count];
			temp := 999;
		  for cont := 1 to numfunc do //Apesar de cada departamento ser capaz de armazenar 9000 codigos unicos (1000-9999), � poss�vel que a fun��o random gere 2 n�meros iguais num mesmo departamento, e consequentemente, 2 funcion�rios teriam o mesmo c�digo de funcion�rio.
		    begin
			    if (codigo[count] = codigo[cont])AND(count <> cont) then //Se este algoritmo encontrar dois c�digos iguais, ele vai deixar de gerar n�meros aleat�rios, e vai tentar todos n�meros de 1000 a 9999 at� encontrar um n�mero que n�o foi levado.
			      begin
				  	   inc(temp);
					     str(temp,temp2);
						 	 codigo[count] := acronimo[id] + temp2; 
					     cont := 0; 
					  end;            
			  end;		 		        
		  ClrScr;            
		  write('Introduza o sexo do funcionario: ("M" ou "F")');
		  repeat
		    sexo[count] := upcase(readkey);
		    if (sexo[count] <> 'M')AND(sexo[count] <> 'F') then
		        writeln('Sexo invalido.');
		  until (sexo[count] = 'M')OR(sexo[count] = 'F'); 
		  repeat
		     mensagem := 'Qual e a data de nascimento desse funcionario?';
		 	   Data;                             
		 	   datanascimento[count] := temp3;
		 		 mensagem := 'Qual foi a data de inicio do trabalho desse funcionario?';
		 		 Data;                         
		 		 datainicio[count] := temp3;   
		 	   (*Nesta area n�s levamos as datas no formato dd-mm-aaaa e colocamos como aaaammdd para comparar a data de nascimento e a data de inicio do trabalhotemp2 := copy(datanascimento[count],7,4) + copy(datanascimento[count],4,2) + copy(datanascimento[count],1,2); 
		 	    Exemplo: 12-04-2002 passa a ser 20020412 e 05-04-2002 passa a ser 20020405*)
				 temp2:= copy(datanascimento[count],7,4) + copy(datanascimento[count],4,2) + copy(datanascimento[count],1,2);
				 temp3 := copy(datainicio[count],7,4) + copy(datainicio[count],4,2) + copy(datainicio[count],1,2);
				 val(temp2,temp,e);
				 val(temp3,temp4,e);                          
				 temp := temp4 - temp;     
				 if temp < 180000 then //Usando a l�gica em cima, podemos ver que 18 anos pode ser representado por 180000. Exemplo: 20181001-20001001 = 18000, e se compararmos 01-10-2000 com 01-10-2018, vemos que de facto s�o exatamento 18 anos.
				  begin
					  writeln('Data de nascimento: ',datanascimento[count]);
						writeln('Data de inicio do trabalho: ',datainicio[count]);
						writeln;
						if temp >= 0 then
						    mensagem := 'A idade minima para comecar a trabalhar e de 18 anos.'
						 else
						   mensagem := 'Nao e possivel comecar a trabalhar antes da sua data de nascimento.';  
						for cont := 1 to length(mensagem) do
						  begin
						    write(copy(mensagem,cont,1));
						    delay(8);
							end;  
						readln;
						invalido := true;
				  end;
		  until invalido = false;                        
		  ClrScr;
		  writeln('Qual e o salario desse funcionario?');
		  read(salario[count]);
		  while salario[count] < 3000 do
		   begin
		     writeln('Salario abaixo do minimo.');
		     read(salario[count]);
		   end;
			ClrScr;   
		  writeln('Escreva o email institucional.');
		  read(email[count]);
		  inc(numfunc); //N�mero de funcion�rios aumenta por 1
		end; 
	 ClrScr;
	 writeln;
   mensagem := 'Funcionarios cadastrados com sucesso.';
 	 for count := 1 to length(mensagem) do
		 begin
		   write(copy(mensagem,count,1));
		   delay(8);
		 end;
	 delay(2000);  
	 writeln;  
	 writeln('Registrar mais funcionarios? (s = sim, n = nao)');
	 writeln;
	 resposta := upcase(readkey);
	 while (resposta <> 'S')AND(resposta <> 'N') do
		 begin
		   writeln('Resposta invalida. (s = sim, n = nao)');
		   resposta := upcase(readkey);
		 end;
	 if resposta = 'S' then
		  CadastroFuncionario; 
	 end
	else
	  begin  
		  mensagem := 'Opah. Para cadastrar os funcionarios, cadastre pelo menos um departamento.';
		  writeln;
			for count := 1 to length(mensagem) do
		    begin
		       write(copy(mensagem,count,1));
		       delay(8);
		    end;
		  writeln;
		  writeln('Aperte ENTER para voltar para o menu.');
		  readln;
		end; 
	Menu;
End;

Procedure VisitaDepartamentos;
	                      
Begin
	  
	  ClrScr;
  if numdep > 0 then
	 begin
		textcolor(15);
		writeln;
		writeln('                                                DEPARTAMENTOS');
		writeln('_____________________________________________________________________________________________________________');
		writeln;
		writeln;
		writeln;
		for count := 1 to numdep do
		  begin
		    writeln(count,'. ',departamentos[count],' = ',acronimo[count]);
		  end;  
		writeln;
		writeln;
		writeln;
		writeln;
		writeln;
		writeln;
		writeln;
		writeln('Escreva o n�mero do departamento que deseja acessar ou aperte "v" para voltar.');
		if relatorio2 = true then
      begin
			  writeln('Ou aperte "p" para procurar o relatorio de um funcionario.');
		    read(resposta);
		  end;
		if (relatorio2 = true)AND(resposta = 'p') then
			begin
				writeln('Escreva o codigo ou nome do funcionario.');
				procura := true;
				read(resposta);
				upcase(resposta);
				for count := 1 to numfunc do
					begin
						 if resposta = codigo[count] then
						   begin
									id := count;
									encontrado := true;
									Relatorio;
							 end  
							else
								if resposta = upcase(nome[count]) then
									begin
										 id := count;
										 encontrado := true;
										 Relatorio;
									end;																			  
					end;
				writeln('Nenhum funcionario foi encontrado com esse codigo ou nome.');
				ClrScr;
				Relatorio;
			end;
		read(resposta);
		resposta := upcase(resposta);
		val(resposta,temp,e);  //e somente ser� 1 se a fun��o val n�o conseguir converter o valor da vari�vel resposta para um n�mero. Ou seja, n�o � um n�mero. Outrocaso, armazena o n�mero na vari�vel temp.
		while ((e = 1)OR(temp < 1))AND(resposta <> 'V') do
		  begin
				if e = 1 then
					 writeln('Opah. Use numeros apenas ou "v" para voltar.')
				 else
					 writeln('Numero invalido. (1-',cont,')');
					 read(resposta);
				resposta := upcase(resposta);
				val(resposta,temp,t);
			end;
		ClrScr;	
		if resposta = 'V' then
			 Menu;
		dep := acronimo[temp];
		id := temp;
			  espaco[1] := '                                                    ';
			  temp2 := departamentos[id] + ' - ' + chefe[id] + ' (Chefe)'; //Essa informa��o vai aparecer no cabe�alho.
				for count := 1 to (length(temp2) DIV 2) do
				  begin
					  espaco[1] := copy(espaco[1],1,length(espaco[1])-1); //Quanto mais longo for o nome do departamento e do chefe, mais curto ser� o espa�amento.
					end;                                                  //A cada unidade de comprimento do temp2, vari�vel que est� a armazenar o nome do departamento do chefe, o espa�amento diminui por 1 unidade.
				writeln;	
    		writeln(espaco[1],temp2);
				writeln('_____________________________________________________________________________________________________________');
				writeln;
				writeln;
				invalido := true;
				for cont := 1 to numfunc do   //Esta sec��o vai verificar se o departamento escolhido tem pelo menos 1 funcion�rio cadastrado nele.
				  begin
				     if dep = copy(codigo[cont],1,length(dep)) then //A vari�vel dep � o acr�nimo do departamento que foi escolhido. O acr�nimo do departamento � escolhido pelo gerente. Ele pode decidir, por exemplo, que o acr�nimo do Departamento de Matem�tica e Inform�tica � DMI.
						    invalido := false;         //Visto que o c�digo de um funcion�rio � formado pelo acr�nimo do departamento em que est� cadastrado, n�s podemos ler os c�digos de todos funcion�rios para ver se existe pelo menos 1 funcion�rio com um c�digo que tenha o acr�nimo do departamento escolhido, ou seja, se est� nesse departamento.
				  end;				  									//Se o algoritmo n�o encontrar nenhum, quer dizer que ningu�m foi cadastrado l�, e vai mostrar a mensagem escrita na linha 476.					
				if invalido = true then
				 begin
				   if relatorio2 = false then
              mensagem := 'Para acessar as contas dos funcionarios, cadastre pelo menos um nesse departamento.'
            else
              mensagem := 'Para acessar os relatorios dos funcionarios, cadastre pelo menos um nesse departamento.';
 	 				 for count := 1 to length(mensagem) do
		 				 begin
		   				 write(copy(mensagem,count,1));
		   			   delay(8);
		 				 end;
	 			   delay(2000);
	 			   writeln;
	 			   writeln('Aperte ENTER para voltar para a lista dos departamentos.');
	 			   readln;
	 			   VisitaDepartamentos;
	 			 end
				else
				  begin	 
				   cont := 1; 	 
		    	 for count := 1 to numfunc do
		      	 begin
		            if dep = copy(codigo[count],1,length(dep)) then
		         	    begin
							 			writeln(cont,'. Nome: ',nome[count],'  Codigo: ',codigo[count],'  Cargo: ',cargo[count]);
		           			inc(cont);
					   			end;
						 end;	
					 dec(cont);	 
					 writeln;	
					 writeln;
					 writeln;
					 writeln('Escreva o n�mero do funcion�rio que deseja acessar, ou aperte "v" para voltar,');
					 if relatorio2 = false then
					    writeln('"r" para remover uma conta, ou "m" para mover um funcionario para um outro departamento.');
					 read(resposta);
					 resposta := upcase(resposta);
					 val(resposta,temp,e);  //t somente ser� 1 se a fun��o val n�o conseguir converter o valor da vari�vel resposta para um n�mero. Ou seja, n�o � um n�mero. Outrocaso, armazena o n�mero na vari�vel temp.
					 while ((e = 1)OR(temp < 1)OR(temp > cont))AND(resposta <> 'V')AND(resposta <> 'R')AND(resposta <> 'M') do //O cont � o n�mero de funciion�rios do departamento.
				      begin
				   	     if e = 1 then
					   		   writeln('Opah. Use numeros apenas ou "v" para voltar.')
				          else
					   			  writeln('Numero invalido. (1-',cont,')');
					 			 read(resposta);
				   		   resposta := upcase(resposta);
					 			 val(resposta,temp,e);
			        end;  
			     ClrScr;
			  	 if resposta = 'V' then
				   	  VisitaDepartamentos
						else
						  if relatorio2 = false then
               begin
								if resposta = 'R' then
							   begin              
								  writeln('Qual funcionario deseja remover?');
								  con := 1;
								  for count := 1 to numfunc do
								    begin
								      if dep = copy(codigo[count],1,length(dep)) then
											   begin
												   writeln(con,'. ',nome[count]);
											   	 inc(con);
											   end;	 
								    end;
									read(resposta);
									resposta := upcase(resposta);
								  val(resposta,temp,e);
								  while (e = 1)OR(temp > cont)OR(temp < 0) do
								    begin
								       writeln('Resposta invalida. (1-',cont,')');
								       read(resposta);
								       resposta := upcase(resposta);
								  		 val(resposta,temp,e);
								    end;
								  if temp = 0 then
									   VisitaDepartamentos;  
								  con := 0;
									for count := 1 to numfunc do
									  begin
										   if dep = copy(codigo[count],1,length(dep)) then
										      inc(con);
										   if temp = con then
											    break;   
										end;  
								  id := count;  
								  temp2 := nome[id];
								  for count := id to numfunc do      //Para simularmos a remo��o de uma conta, simplesmente fazemos um overwrite, ou seja, todas contas que estiverem numa posi��o acima daquela que estamos a apagar deixe uma posi��o.
									  begin                            //Exemplo: se apagamos uma conta na posi��o 15 dos vetores, ent�o a conta 16 passa a ser 15, a 17 passa a 16, e assim sucessivamente. E decrementamos a vari�vel que armazena o n�mero de funcion�rios, numfunc.
										   nome[count] := nome[count+1];
										   sexo[count] := sexo[count+1];
											 codigo[count] := codigo[count+1];
											 datanascimento[count] := datanascimento[count+1];
											 datainicio[count] := datainicio[count+1];
											 cargo[count] := cargo[count+1];
											 email[count] := email[count+1];
											 salario[count] := salario[count+1];										   
											 for con := 1 to 12 do
											   begin
												   saude[count,con] := saude[count+1,con];
											 		 escola[count,con] := escola[count+1,con];
											 		 vestuario[count,con] := vestuario[count+1,con];
											 		 alimentacao[count,con] := alimentacao[count+1,con];
													 capricho[count,con] := capricho[count+1,con];
											 		 lazer[count,con] := lazer[count+1,con];
											 		 poupanca[count,con] := poupanca[count+1,con];
											 		 resto[count,con] := resto[count+1,con];
											 	 end;	 
										end;  
									mensagem := 'Conta de ' + temp2 + ' foi removida com sucesso.';	
									for count := 1 to length(mensagem) do
											begin
												 write(copy(mensagem,count,1));
												 delay(8);
											end;
									  delay(2800);	  
									dec(numfunc);
									ClrScr;
									VisitaDepartamentos;
								end
							else
							  if resposta = 'M' then
								  begin
								  	writeln('Qual funcionario deseja mover?');
								  	con := 1;
								    for count := 1 to numfunc do
								      begin
								        if dep = copy(codigo[count],1,length(dep)) then
											   begin
												   writeln(con,'. ',nome[count]);
											   	 inc(con);
											   end;	 
								    end;
										read(resposta);
								  	upcase(resposta);
								  	val(resposta,temp,e);
								  	while (e = 1)OR(temp > cont)OR(temp < 0) do
								      begin
								        writeln('Resposta invalido. (1-',cont,')');
								        read(resposta);
								  		  upcase(resposta);
												val(resposta,temp,e);
								      end;
								    if temp = 0 then
										   VisitaDepartamentos;  
								    con := 0;
									  for count := 1 to numfunc do
									    begin
										    if dep = copy(codigo[count],1,length(dep)) then
										       inc(con);
										    if temp = con then
											     break;   
										  end;      
								    id := count;  
										writeln('Para qual departamento deseja mover esse funcionario? Escreva o acr�nimo do departamento.');	  
								  	writeln;
										for count := 1 to numdep do
								  	  begin
								  	    writeln(departamentos[count],' = ',acronimo[count]);
								  	  end;
										read(resposta);
										resposta := upcase(resposta);
								  	invalido := true;
								  	for count := 1 to numdep do
								  	  begin
								  	    if resposta = acronimo[count] then
								  	      begin
								  	        delete(codigo[id],1,length(dep));
								  	        codigo[id] := resposta + codigo[id];
								  	        invalido := false;
								  	        temp := count;
								  	      end;
											end;
										if invalido = true then
											  mensagem := 'Error. Departamento nao encontrado. Tente novamente.'
										 else
										   begin
											    if sexo[id] = 'M' then
													  mensagem := nome[id] + ' movido com sucesso para o ' + departamentos[temp]	  
								           else
								             mensagem := nome[id] + ' movida com sucesso para o ' + departamentos[temp];	  
								       end;      
										for count := 1 to length(mensagem) do
											begin
												 write(copy(mensagem,count,1));
												 delay(8);
											end;
									  delay(2800);
									  VisitaDepartamentos;
									end;	  
			  	     end;
					 cont := 0; 
					 id := temp;	 
		    	 for count := 1 to numfunc do // Vai procurar o funcion�rio da posi��o escolhida.
		     		 begin
		            if dep = copy(codigo[id],1,length(dep)) then
		         			 begin
						         inc(cont);
					     			 if cont = temp then
					     			    break;
					   		   end;  		
					   end;                   
					 id := count; //A vari�vel inteira "id" guarda a posi��o de interesse dos arrays.						
					 Display;
	   	      end;
		end	 
	else                                                                      
	  begin
	     textcolor(15);
		   writeln('                                                DEPARTAMENTOS');
			 writeln('_____________________________________________________________________________________________________________');
		   writeln;
		   writeln;
		   writeln;
		   mensagem := 'Para visitar os departamentos, registe pelo menos um departamento.';
			 for count := 1 to length(mensagem) do
		     begin
		       write(copy(mensagem,count,1));
		       delay(8);
		     end;
		   delay(2000);  
		   writeln;
		   writeln;
			 writeln('Aperte ENTER para voltar para o menu.');  
			 readln;      			 			 
			 Menu;
	  end;	   	                   
End;		

Procedure Relatorio;

Begin
		ClrScr;
    if procura = true then
		 begin
		   if (encontrado = false)AND(conta = 'gerente') then
		  begin
			  relatorio2 := true;
        VisitaDepartamentos;
        relatorio2 := false;
      end;
    if (conta = 'gerente')AND((numfunc = 0)OR(numdep = 0)) then
      begin
			 writeln('Nenhum funcionario cadastrado.');
			 readln;
			 Menu;
		  end;
		end;
		procura := false;  
		encontrado := false;
    writeln;
    writeln('======================================================');
    writeln('||         MESES CORRESPONDENTES DAS DESPESAS        ');
    writeln('=======================================================');
    writeln;
    writeln('=======================================================');
    writeln('|| [1] 	Mes de Janeiro                              ');
    writeln('|| [2]	  Mes de Fevereiro                            ');
    writeln('|| [3] 	Mes de Marco	                              ');
    writeln('|| [4] 	Mes de Abril                                ');
    writeln('|| [5] 	Mes de Maio                                 ');
    writeln('|| [6] 	Mes de Junho                                ');
    writeln('|| [7] 	Mes de Julho                                ');
    writeln('|| [8] 	Mes de Agosto                               ');
    writeln('|| [9] 	Mes de Setembro                             ');
    writeln('|| [10]  Mes de Outubro                              ');
    writeln('|| [11]  Mes de Novembro                             ');
    writeln('|| [12]  Mes de Dezembro                             ');
    writeln('======================================================');
    writeln;
    write('Digite o numero do mes: ');
    read(temp);
    While NOT(temp in [1..12]) do
    begin
      write('Digite o numero entre 1 e 12: ');
      read(temp);
    end;   
		case temp of
        1 : temp2 := 'Janeiro';
        2 : temp2 := 'Fevereiro';
        3 : temp2 := 'Marco';
        4 : temp2 := 'Abril';
        5 : temp2 := 'Maio';
        6 : temp2 := 'Junho';
        7 : temp2 := 'Julho';
        8 : temp2 := 'Agosto';
        9 : temp2 := 'Setembro';
        10 : temp2 := 'Outubro';
        11 : temp2 := 'Novembro';
        12 : temp2 := 'Dezembro';
    end;                                        
    clrscr;
 if (feito[id,temp] = false)AND(conta = 'funcionario') then
   begin
	   write('Informe as Despesas: ');
     writeln;
     write('Saude: (Limite = ',0.15*salario[id],')');
     read(saude[id,temp]);
     While(saude[id,temp]>0.15*salario[id])do
     Begin
       write('Nao pode Gastar Mais que os 15 porcentos do salario para essa despesa');
       write('Volte a informar a despesa: ');
       read(saude[id,temp]);
     end;
     clrscr;
     write('Alimentacao: (Limite = ',0.35*salario[id],')');
     read(alimentacao[id,temp]);
     While(alimentacao[id,temp]>0.35*salario[id])do
     Begin
       writeln('Nao pode Gastar Mais que os 35 porcentos do salario para essa despesa');
       write('Volte a informar a despesa: ');
       read(alimentacao[id,temp]);
     end;
     clrscr;
     write('Escola: (Limite = ',0.15*salario[id],')');
     read(escola[id,temp]);
     While(escola[id,temp]>0.15*salario[id])do
     Begin
       writeln('Nao pode Gastar Mais que os 15 porcentos do salario para essa despesa');
       write('Volte a informar a despesa: ');
       read(escola[id,temp]);
     end;
     clrscr;
     writeln('Vestuario: (Limite = ',0.1*salario[id],')');
     read(vestuario[id,temp]);
     While(vestuario[id,temp]>0.1*salario[id])do
     Begin
       writeln('Nao pode Gastar Mais que os 10 porcentos do salario para essa despesa');
       write('Volte a informar a despesa: ');
       read(vestuario[id,temp]);
     end;
     clrscr;
     write('Capricho: (Limite = ',0.05*salario[id],')');
     read(capricho[id,temp]);
     While(capricho[id,temp]>0.05*salario[id])do
     Begin
       writeln('Nao pode Gastar Mais que os 5 porcentos do salario para essa despesa');
       write('Volte a informar a despesa: ');
       read(capricho[id,temp]);
     end;
     clrscr;
     write('Lazer: (Limite = ',0.1*salario[id],')');
     read(lazer[id,temp]);
     While(lazer[id,temp]>0.1*salario[id])do
     Begin
       writeln('Nao pode Gastar Mais que os 10 porcentos do salario para essa despesa');
       write('Volte a informar a despesa: ');
       read(lazer[id,temp]);
     end;
     clrscr;
     write('Poupanca: (Limite = ',0.1*salario[id],')');
     read(poupanca[id,temp]);
     While(poupanca[id,temp]>0.1*salario[id])do
     Begin
       writeln('Nao pode Gastar Mais que os 10 porcentos do salario para essa despesa');
       write('Volte a informar a despesa: ');
       read(poupanca[id,temp]);
     end;
     total[id,temp] := saude[id,temp] + escola[id,temp] + capricho[id,temp] + alimentacao[id,temp] + vestuario[id,temp] + lazer[id,temp];
     poupanca[id,temp] := salario[id] - total[id,temp];
	end;
		 clrscr;
     writeln;
	   Writeln('--------------Relatorio Dos Gastos do Mes de ',temp2,'--------------');
	   writeln;
     writeln('                   Nome do Funcionario: ',nome[id]);
    writeln;
	  writeln('Saude: (Limite = ',0.15*salario[id],'mts)                   Alimentacao: (Limite = ',0.35*salario[id],'mts');
	  writeln('       Valor gasto = ',saude[id,temp],'mts                              Valor gasto = ',alimentacao[id,temp],'mts');        
	  writeln;
		writeln('Escola: (Limite = ',0.15*salario[id],'mts)                  Vestuario: (Limite = ',0.1*salario[id],'mts)');
	  writeln('        Valor gasto = ',escola[id,temp],'mts                              Valor gasto = ',vestuario[id,temp],'mts');
		writeln;
    writeln('Capricho: (Limite = ',0.05*salario[id],'mts)                   Lazer: (Limite = ',0.1*salario[id],'mts)');
	  writeln('          Valor gasto = ',capricho[id,temp],'mts                              Valor gasto = ',lazer[id,temp],'mts');
		writeln;
    writeln('                    Poupanca: ',Poupanca[id,temp],'mts');
	  writeln;
	  writeln('                    Total das despesas: ',Total[id,temp],'mts');
	  writeln;
    writeln;
    if conta = 'funcionario' then
		   writeln('Confirmar? (s = sim, n = nao)')
     else
       begin
			   writeln('Aperte qualquer tecla para voltar');
         readln;
         VisitaDepartamentos;
       end;  
		resposta := upcase(readkey);
    repeat
       invalido := false;
       if resposta = 'S' then
         begin
           ClrScr;
           writeln('Despesas para o mes de ',temp2,' cadastras com sucesso.');
           feito[id,temp] := true;
					 delay(2000);
           VisitaDepartamentos;
         end 
        else
				  if resposta = 'N' then 
					  begin
						  ClrScr;
						  writeln('Atualizacao do mes de ',temp2,' canceladas.');
						  delay(2000);
						  VisitaDepartamentos;
						end
					else
					  begin
						  writeln('Resposta invalida.');	       						  
						  invalido := true;
						end;  
		until	invalido = false;	  
           
End;
		
Procedure Menu;

Begin

ClrScr;
textcolor(15);
writeln;
writeln('                                          GESTAO DE DESPESAS - Menu                                          ');
writeln('_____________________________________________________________________________________________________________');
writeln;
writeln;
writeln;
textcolor(15);
writeln('  1. Cadastro dos Departamentos.');
writeln;
textcolor(11);
writeln('               ----             ');
writeln('            .        .          ');
writeln('          .____________.        ');
writeln('   ___    |  _      _  |        ');
writeln('  |~~~|   | |_|  _ |_| |        ');
writeln('  |~~~|   |     |o|    |        ');
writeln('  �---�   |_____| |____|        ');
textcolor(15);
writeln;
writeln('  2. Cadastro dos Funcionarios.');
writeln;
textcolor(11);
writeln('               .  .               ');
writeln('             .      .             ');
writeln('            .        .            ');
writeln('            .        .            ');
writeln('             .      .             ');
writeln('              .    .              ');
writeln('            .        .            ');
writeln('         .              .         ');
writeln('        .                .        ');
textcolor(15);
writeln;
writeln('  3. Visita dos Departamentos.');
writeln;
textcolor(11);
writeln('               ----             ');
writeln('            .        .          ');
writeln('          .____________.        ');
writeln('          |  _      _  |        ');
writeln(' _____\   | |_|  _ |_| |        ');
writeln('      /   |     |o|    |        ');
writeln('          |_____| |____|        ');
textcolor(15);
writeln;
writeln('  4. Relatorio das Despesas.');
writeln;
textcolor(11);
writeln('         ____________  ');
writeln('        |  Despesas  | ');
writeln('        | ---------- | ');
writeln('        | ---------- | ');
writeln('        | ---------- | ');
writeln('        | ---------- | ');
writeln('        | ---------- | ');
writeln('        |____________| ');
textcolor(15);
writeln;
writeln('  5. Sair.');
writeln;
writeln;   
writeln('Qual area deseja acessar? (1-5)');
read(t);    
while (t < 1)OR(t > 5) do
  begin
    writeln('Resposta invalida. (1-5)');
    read(t);
  end;  
case t of
	1 : CadastroDepartamento;
	2 : CadastroFuncionario;
	3 : VisitaDepartamentos;
	4 : Relatorio;
	5 : Contas;
end; 

End;		
{Programa principal}		
Begin

Contas; 
  
End.