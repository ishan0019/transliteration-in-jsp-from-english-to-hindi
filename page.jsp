<%@ page language="java" import="java.io.*,java.util.*,java.sql.*,java.net.*"%>
<%@ page language="java" import="java.text.*" %>
<%@ include file="con1.jsp"%>

<%  String userdata ="agni",str="" ,data4,data2,data3,fileName2 = "/new/sym.txt",fileName3 = "/new/vow.txt",fileName4 = "/new/unicodes1.txt",str2="",str3="",str4="" ;
	String userdata_ar[] = new String [1000], url[] = new String[100000],uni[] = new String[100000] ,title[] = new String[100000] , da2[]=new String[1000], da3[]=new String[1000],da4[] = new String [1000];
        
		userdata = userdata.toLowerCase();
        
         userdata = userdata.replace("`","");    userdata = userdata.replace("~","");   userdata = userdata.replace("!","");   userdata = userdata.replace("@","");
         userdata = userdata.replace("$","");    userdata = userdata.replace("%","");   userdata = userdata.replace("^","");   userdata = userdata.replace(",","");
         userdata = userdata.replace("*","");    userdata = userdata.replace("(","");   userdata = userdata.replace(")","");   userdata = userdata.replace("|","");
         userdata = userdata.replace("_","");    userdata = userdata.replace("+","");   userdata = userdata.replace("=","");   userdata = userdata.replace("\\","");   
         userdata = userdata.replace("{","");    userdata = userdata.replace("}","");   userdata = userdata.replace("[","");   userdata = userdata.replace("]","");
         userdata = userdata.replace(":","");    userdata = userdata.replace("\"","");  userdata = userdata.replace("\'","");  userdata = userdata.replace(".","");
         userdata = userdata.replace("<","");    userdata = userdata.replace(">","");    userdata = userdata.replace("?","");  userdata = userdata.replace("/",""); 
                 
        userdata_ar = userdata.split(" ");	
        
    int i,e,f,j,k,x=0, posx=0, posy=0, c_flag=0, s_flag=0 , l=0,datalength=0,t_length=0,series_no=1,flagonce=0;   
	int index_resultset[] = new int[100000],l_resultset=0,len=0;
	
		
	String var = "",dbstring="",links="";
    float count[] = new float[100000];	 
	    
		     InputStream ins2 = application.getResourceAsStream(fileName2);
		     InputStream ins3 = application.getResourceAsStream(fileName3);
		     InputStream ins4 = application.getResourceAsStream(fileName4);
	
     	if(ins2!=null)
	    {
			BufferedReader br = new BufferedReader((new InputStreamReader(ins2)));
			
			while((data2= br.readLine())!= null)
			{
				String p2=data2;
				str2=str2+p2+" ";
			}
			
			da2=str2.split("=| ");
		}
			
		if(ins3!=null)
	 	{
			BufferedReader br = new BufferedReader((new InputStreamReader(ins3)));
			
			while((data3= br.readLine())!= null)
			{
				String p3=data3;
			  	str3=str3+p3+" ";
			}
			da3=str3.split("=| ");
		}	
		
		if(ins4!=null)
	    {
			BufferedReader br = new BufferedReader((new InputStreamReader(ins4)));
		
   		    while((data4= br.readLine())!= null)
			{
				String p4=data4;
				str4=str4+p4+" ";
			}
			da4=str4.split("=| ");
		}	
		
        k=0;

     String mainstring[],output_ar[] = new String[100000];
     String sub = "",sub1="",output = "";
     int output_count=0,input_count=0;
	 
   
     while( input_count < userdata_ar.length )		
    {	flagonce=0;
	    if( userdata_ar[input_count] != null && !userdata_ar[input_count].equals("") )
        {   	
			    PreparedStatement pst0=null;
                pst0=con.prepareStatement("select * from hindi where url like '%"+userdata_ar[input_count]+"%' or uni like '%"+userdata_ar[input_count]+"%'");
                ResultSet rs0= null;
				rs0=pst0.executeQuery();	
	            
		     
			while(rs0.next())
            {   
			       url[t_length] = rs0.getString("url");
				   uni[t_length] = rs0.getString("uni").substring(0,rs0.getString("uni").length()>1000 ? 1000:rs0.getString("uni").length());
		    	   title[t_length] = rs0.getString("title");
				t_length++;	   
				
				userdata_ar[input_count]="$";
			}
		   	
		}
		
		if( !userdata_ar[input_count].equals("$") )
		{    
		     mainstring = new String[1000];  
			
			 userdata="";   output = "" ;    output_count=0;    j=4;
             
			 userdata = userdata_ar[input_count];
	        
             while(j>0 && !userdata.equals("$"))
            {   datalength = userdata.length();                
		
	    	    if( datalength < j )
		             j=datalength;
		    
	            if( datalength >= 3)
		            datalength = userdata.length()-j;      
	         			 
		        for(i = 0; i <=datalength; i++)
	            {                                 
	                 s_flag = 0;
			   
			        if(userdata.length() >=3)
			            sub = userdata.substring(i,i+j);
			        else 
			        {   if( j == 2)       
			                sub = userdata.substring(0,2);
				        else  if( j == 1 && i >0 )   
				                 sub = userdata.substring(i-1,i);
				    }
	                            
         //############    dealing wid consonants and vowels     ############ 	                                      
	
		            for( k = 0; k < da4.length; k++ )  
		            {   //############    CONSONANTS   ##############
			
		                if(sub.equals(da4[k]) && k%2==0)
			            {                          
			                 posx = k;   l = 0;   sub1="";
		
			                if(datalength <= 2)	    sub1 = userdata.substring(0,datalength);        				       
				            else    if (datalength >= i+j )    sub1 = userdata.substring(i+j,i+j+1);  	   // && i+j+1<=datalength
                                     else    if( i+j > datalength )   sub1="";
				    		                      
					        if( j == 1 )
			                {   mainstring[i] = da4[k+1];
						        userdata = userdata.replaceFirst(sub," ");
								  
						        for(int z=0;z<da4.length;z=z+2)
						        { 
						            if(sub1.equals(da4[z]) && !sub1.equals("0") && !sub1.equals("1") && !sub1.equals("2") && !sub1.equals("3") && !sub1.equals("4") && !sub1.equals("5") && !sub1.equals("6") && !sub1.equals("7") && !sub1.equals("8") && !sub1.equals("9") && !sub1.equals("-") && !sub1.equals("/") )
							        {   mainstring[i] +="&#2381;";
								   
						 	        }
						        }
					        }
                     		  
					        if( j==2  )
                 	        {    int r_flag=0;
						
						        if( sub.equals("ri") && i > 0)
						        {   r_flag=1;
							        if( !userdata.substring(i-1,i).equals("a") && !userdata.substring(i-1,i).equals("e") && !userdata.substring(i-1,i).equals("i") &&  !userdata.substring(i-1,i).equals("o") && !userdata.substring(i-1,i).equals("u") && !userdata.substring(i-1,i).equals("#"))
							        {    mainstring[i] = da4[k+1];
							             userdata = userdata.replaceFirst(sub,"  ");									 
							        }
                      	        }
	
                                if( r_flag==0 )
     					        {	mainstring[i] = da4[k+1];
						            userdata = userdata.replaceFirst(sub,"  ");
								   
						            for(int z=0;z<da4.length;z=z+2)
							        { 
							            if(sub1.equals(da4[z]))
							            mainstring[i] +="&#2381;";
							        }   
						        }
				            }
                  	
					        if(j==3)
				            {	mainstring[i] = da4[k+1];
						        userdata = userdata.replaceFirst(sub,"   ");
								   
						        for(int z=0;z<da4.length;z=z+2)
						        { 
					                if(  sub1.equals( da4[z] ) )
						            mainstring[i] +="&#2381;";
						        }  
					        }
					
					        if( j==4 )
	                        {   mainstring[i] = da4[k+1];
                      	        userdata = userdata.replaceFirst(sub,"    ");
									   
						        for(int z=0;z<da4.length;z=z+2)
						        {
						            if( sub1.equals( da4[z] ) )
						                mainstring[i] += "&#2381;";
						        }
					        }
                        }
							                  
	         //#######################    VOWELS   ###########################
		
			            if( k < da2.length )
			            {   
			                if( sub.equals( da2[k] ) && k % 2 == 0)
			                {   posy = k;   l = 0;   s_flag = 1;
				
						        if(i == 0)
		                        {
                		            for(int k1 = 0; k1 < da3.length; k1++)
			                        {           
                 			            sub = userdata.substring( i,j+i );
				
                          		        if(sub.equals(da3[k1]) && k1%2==0)
                        		        {   sub1="";
                        			
									        if(j==1)
                             		        {   mainstring[i] = da3[k1+1];
                            	                userdata = userdata.replaceFirst(sub,"#");
									        }
											                    
				                            if(j==2)
				                            {   mainstring[i] = da3[k1+1];
										        userdata = userdata.replaceFirst(sub,"##");
				                            }
				                    
									        if(j==3)
				                            {   mainstring[i] = da3[k1+1];
								                userdata = userdata.replaceFirst(sub,"###");
                               	            }   
                      			        }
			                        }         
		                        }
				
		                        else
						        {    if(j==1)
  				                    {  	int vow_flag=0;
								
							     	    for(int z=1;z<da2.length;z=z+2)
								        {   
								            if( i+2<=userdata.length() )
									        {
									            if( userdata.substring(i-1,i).equals(da2[z]) || userdata.substring(i,i+2).equals("ri") || userdata.substring(i-1,i).equals("#"))
									                vow_flag=1;
									        }	
								        }	 
											
  								        if(vow_flag == 0)
								        {   mainstring[i] = da2[k+1]; 
 				                            userdata = userdata.replaceFirst(sub,"#");
								        }
								        else
								        {   for(int z=0;z<da3.length;z=z+2)
									        {   if(sub.equals(da3[z]))
										        {   mainstring[i] = da3[z+1]; 
 				                  		            userdata = userdata.replaceFirst(sub,"#");
								  		            break;
                                                }										        
                                            }
								        } 
							        }
  				            
							        if(j==2)
				                    {   int vow_flag=0;
									
								        for(int z=0;z<da2.length;z=z+2)
								        {   if( i+2<=userdata.length() )
									        {   if( userdata.substring(i-1,i).equals(da2[z]) || userdata.substring(i,i+2).equals("ri") || userdata.substring(i-1,i).equals("#"))
									                vow_flag=1;break;
									        }	
								        }	 
											
  								        if(vow_flag == 0)
								        {   mainstring[i] = da2[k+1]; 
								            userdata = userdata.replaceFirst(sub,"##");
								        }
								        else
								        {   for(int z=0;z<da3.length;z=z+2)
									        {   if(sub.equals(da3[z]))
										        {   mainstring[i] = da3[z+1]; 
 				                                    userdata = userdata.replaceFirst(sub,"##");
								                    break;
                                                }										        
     		                                }
								        } 
 				                    }
				            
							        if(j==3)
 		                            {   int vow_flag=0;
									
								        for(int z=1;z<da2.length;z=z+2)
								        {   if( i+2<=userdata.length() )
									        {   if( userdata.substring(i-1,i).equals(da2[z]) || userdata.substring(i,i+2).equals("ri") || userdata.substring(i-1,i).equals("#"))
									                vow_flag=1;break;
									        }	
								        }	 
											
  								        if(vow_flag == 0)
								        {   mainstring[i] = da2[k+1]; 
									        userdata = userdata.replaceFirst(sub,"###");
								        }
								        else
								        {   for(int z=0;z<da3.length;z=z+2)
									        {   if(sub.equals(da3[z]))
										        {   mainstring[i] = da3[z+1]; 
 				                                    userdata = userdata.replaceFirst(sub,"###");
                                                    break;
                                                }										        
        	                                }
								        }
							        }
				                }
			                }                       
	                    }	
		            }
	  	        }  
    
             j--;                                        
            }

 //###########   converting array of string to string      ###########
    
	 
        for(i=0;i<mainstring.length;i++)
        {   if( mainstring[i] != null&&!mainstring[i].equals("") )
		         output+=mainstring[i];
        }
        output_ar[output_count++] =  output;
        
 //###########   to resolve ambiguity of t      ###########
 
    i=0;   datalength=0;    sub="&#2335;";
  
        for(i=0;i<=output.length()-7;i++)
        {
             if( sub.equals(output.substring( i,i+7)) )
	            datalength++;
        }
 
    i=0;
    
	    while(i<datalength)
        {
             output = output.replaceFirst("&#2335;","&#2340;");							  
             output_ar[output_count++] =  output;
     	     i++;
	    }
	
 //###########   to resolve ambiguity of d      ###########
	
     i=0;   datalength=0;    sub="&#2337;";
   
        for(i=0;i<=output.length()-7;i++)
        {
            if( sub.equals(output.substring( i,i+7)) )
	            datalength++;
        }
 
     i=0;
    
	    while(i<datalength)
        {
            output = output.replaceFirst("&#2337;","&#2342;");							  
       	    output_ar[output_count++] =  output;
	        i++;
	    }  	
	
 //###########   to resolve ambiguity of tr      ###########	

     i=0;   datalength=0;    sub="&#2340;&#2381;&#2352;";
      
        for(i=0;i<=output.length()-21;i++)
        {
            if( sub.equals(output.substring( i,i+21)) )
	            datalength++;
        }
 
     i=0;
  
        while(i<datalength)
        {
            output = output.replaceFirst("&#2340;&#2381;&#2352;","&#2335;&#2381;&#2352;");							  
            output_ar[output_count++] =  output;
	        i++;
	    }
	
// ###########   to resolve ambiguity of ri     ###########	

     i=0;   datalength=0;	 sub="&#2352;&#2367;";
  
        for(i=0;i<=output.length()-14;i++)
        {
            if( sub.equals(output.substring( i,i+14)) && i==0 )
	            datalength++;
        }
 
     i=0;
  
        while(i<datalength)
        {
             output = output.replaceFirst("&#2352;&#2367;","&#2315;");							  
             output_ar[output_count++] =  output;
	         i++;
	    }

//	###########   to resolve ambiguity of th to TH   ###########

     i=0;   datalength=0;   sub="&#2336;";
  
        for(i=0;i<=output.length()-7;i++)
        {
             if( sub.equals(output.substring( i,i+7)) )
	             datalength++;
        }
 
     i=0;
  
        while(i<datalength)
        {
             output = output.replaceFirst("&#2336;","&#2341;");							  
             output_ar[output_count++] =  output;
	         i++;
	    }

//	###########   to resolve ambiguity of an to A-n   ###########

     i=0;   datalength=0;   sub="&#2366;&#2344;";
   
        for(i=0;i<=output.length()-14;i++)
        {
            if( sub.equals(output.substring( i,i+14)) )
	            datalength++;
        }
 
     i=0;
  
        while(i<datalength)
        {
             output = output.replaceFirst("&#2366;&#2344;","&#2306;");							  
             output_ar[output_count++] =  output;
	         i++;
	    }
	
//	###########   to resolve ambiguity of n to N   ###########

     i=0;  datalength=0;	 sub="&#2344;";
  
        for(i=0;i<=output.length()-7;i++)
        {
            if( sub.equals(output.substring( i,i+7)) )
	            datalength++;
        }
 
     i=0;
  
        while(i<datalength)
        {
             output = output.replaceFirst("&#2344;","&#2339;");							  
             output_ar[output_count++] =  output;
	         i++;
	    }

//	###########   to resolve ambiguity of N to n   ###########

     i=0;  datalength=0;	 sub="&#2339;";
  
        for(i=0;i<=output.length()-7;i++)
        {
            if( sub.equals(output.substring( i,i+7)) )
	            datalength++;
        }
 
     i=0;
  
        while(i<datalength)
        {
             output = output.replaceFirst("&#2339;","&#2344;");							  
             output_ar[output_count++] =  output;
	         i++;
	    }
	
//###########   to resolve ambiguity of dh to DH      ###########

     i=0;  datalength=0;  sub="&#2343;";
      
        for(i=0;i<=output.length()-7;i++)
        {
            if( sub.equals(output.substring( i,i+7)) )
	            datalength++;
        }
     i=0;
  
        while(i<datalength)
        {
             output = output.replaceFirst("&#2343;","&#2338;");							  
             output_ar[output_count++] =  output;
	         i++;
	    }
	
//###########   to resolve ambiguity of th to d      ###########

     i=0;  datalength=0;  sub="&#2336;";
  
        for(i=0;i<=output.length()-7;i++)
        {
            if( sub.equals(output.substring( i,i+7)) )
	            datalength++;
        }
 
     i=0;
  
        while(i<datalength)
        {
             output = output.replaceFirst("&#2336;","&#2342;");							  
             output_ar[output_count++] =  output;
	         i++;
	    }
	
//###########   to resolve ambiguity of U to YUU      ###########

     i=0;  datalength=0;  sub="&#2369;";
      
        for(i=0;i<=output.length()-7;i++)
        {
            if( sub.equals(output.substring( i,i+7)) )
	             datalength++;
        }
 
     i=0;
  
        while(i<datalength)
        {
             output = output.replaceFirst("&#2369;","&#2381;&#2351;&#2370;");							  
             output_ar[output_count++] =  output;
	         i++;
	    }
	
//###########   to resolve ambiguity of a to " "      ###########

     i=0;  datalength=0;   sub="&#2366;";
  
    
        for(i=0;i<=output.length()-7;i++)
        {
            if( sub.equals(output.substring( i,i+7)) )
	            datalength++;
        }
 
     i=0;
  
        while(i<datalength)
        {
             output = output.replaceFirst("&#2366;","");							  
             output_ar[output_count++] =  output;
	         i++;
	    }
	
			
            if(output.substring(0,output.length()).equals("") )
               { out.println("<p style=\" color:#C1C1B8; font-size: 30px; text-align: center; text-shadow: 1px 2px 1px grey;  \" >&#2325;&#2379;&#2312; &#2346;&#2352;&#2367;&#2339;&#2366;&#2350; &#2344;&#2361;&#2368;&#2306; &#2350;&#2367;&#2354;&#2366;</p>");
                 flagonce=1;
				 }
            else
            {   // link and result set
	
                 PreparedStatement pst1=null;
                 pst1=con.prepareStatement("select * from hindi");
                 ResultSet rs1= null;
                 rs1=pst1.executeQuery();	
     	
                
  
                ////////////////     database loop start  /////////////////////////
              
			    while(rs1.next())
                {  
                    dbstring = rs1.getString("uni");
		            links = rs1.getString("url");
				   
		            String dbstring_split[]  = new String[dbstring.length()],resultset[] = new String[ 100000 ];   
	    
		            dbstring_split = dbstring.split(" |\\s|, ");
                    l_resultset = 0;
                    output_count =  output_count >= 4 ? 4 :output_count;
    
		            for(int q=0;q<output_count;q++)
                    {   var="";
     
	                    if(output_ar[q] != null )
                        {	
	                        var = output_ar[q].length() > 6 ? output_ar[q].substring(0,6) : output_ar[q].substring(0,output_ar[q].length());
                            len = var.length() > 6 ? 6 : var.length();
 
                            for(i = 0; i < dbstring_split.length; i++)
                            {  
                                if( dbstring_split[i] != null && !dbstring_split[i].equals("") && dbstring_split[i].length() > len )
                                {
	                                if(var.equals(dbstring_split[i].substring(0,len)) && (dbstring_split[i].length() < output_ar[q].length()+1 || dbstring_split[i].length() > output_ar[q].length()-1) )
                                        resultset[ l_resultset++ ]=dbstring_split[i];
		                        }	
                            }
	 
                            k = 0;
 
                            while( k < l_resultset )
                            {   count[t_length] = 0;
                                index_resultset[t_length] = k;
	
                                String X ="",Y ="";
          	                    X += output_ar[q];  
        	                    Y += resultset[k]; 	
				   
                                int n = X.length(), m = Y.length(), C[][] = new int[n+1][m+1],B[][] = new int[n+1][m+1];
	
                                for (i = 0; i <= n; i++) 
                                    C[i][0] = 0;
        	
                                for (j = 0; j <= m; j++) 
                                    C[0][j] = 0;
                
                                for (i = 1; i <= n; i++) 
								{ 
                                    for (j = 1; j <= m; j++) 
									{
                                        if (X.charAt(i-1) == Y.charAt(j-1)) 
										{
                                            C[i][j]=C[i-1][j-1]+1;
                                            B[i][j]=1;  
                                        }
                                        else    if (C[i-1][j]>=C[i][j-1]) 
										        {
                                                     C[i][j]=C[i-1][j];
                                                     B[i][j] = 2;  
                                                }
                                                else 
												{
                                                    C[i][j]=C[i][j-1];     
                                                    B[i][j]=3;   
                                                }
                                    }
                                }

                                String lcs = new String();
                                i=n;    j=m;
                                while (i!=0 && j!=0) 
								{
                                    if (B[i][j] ==1) 
									{  
                                        lcs =X.charAt(i-1) + lcs;
                                         i = i - 1;
                                         j = j - 1;
                                    }
                                    if (B[i][j] == 2) 
									    i = i - 1;
                                    
                                    if (B[i][j] == 3) 
									    j = j - 1;
                                    
                                }
      
		                        count[t_length] = ( C[n][m] * 100)/output_ar[q].length() ;
		                        url[t_length] = links;
		                        t_length++;
                                k++;
                            }		
 	                    } 
                    }		 
                }	
                
				int flag,temp2;
                float tmp;
                String strtmp="";
                for(i=0;i<t_length;i++)
                {   flag=0;     
                    for(j=0;j<t_length-1-i;j++)
                    {   strtmp="";
                        if(count[j]<count[j+1])
                        {    tmp=count[j];
		                     temp2=index_resultset[j];
		                     strtmp+=url[j];
		                     url[j]="";
		  
                             count[j]=count[j+1];
                             index_resultset[j]=index_resultset[j+1];
                             url[j] += url[j+1];
 		                     url[j+1] = "";
		  
		                     count[j+1]=tmp; 
                             index_resultset[j+1]=temp2;
                             url[j+1] +=strtmp;
		  		  
		                     flag++;
                        }
                    }
  
                    if(flag==0)
                        break;
                }
    

            } 
        
		}
        input_count++;
		
   
    }  
	
			            l_resultset=0;
                  
                for( i=0; i <t_length ; i++)
                {  
                    if(count[i] > 90)
                    {   l_resultset++;
		                if( url[i] != null&& !url[i].equals("") )
                        {    PreparedStatement pst2=null;
                             pst2=con.prepareStatement("select * from hindi where url = '"+url[i]+"'");
                             ResultSet rs2= null;
                             rs2=pst2.executeQuery();	
                 
				             links="";
		    	 
				            while(rs2.next())
                            {   out.println("<br> <a href="+url[i]+" style=' color:#FF0000; font-size: 18px; text-decoration:none;'>"+series_no+") "+rs2.getString("title")+"<p style=' color:#000080; font-size: 14px; '>"+url[i]+"</p></a>");    
    	   	                    series_no++;
       				            links = rs2.getString("uni");
				                out.println("<font size='3' color='#C1C1B8'>"+links.substring(0,links.length()>1000 ? 1000:links.length())+"</font><br><hr>");		 
		                        
							}
			            } 
						 
      		            for(j=i+1;j<t_length;j++)
		                {
			                if( url[i].equals( url[j] ) )
				                url[j]="";
                        }
		            }
                }

	            if(t_length==0 && flagonce == 0)
                    out.println("<p style=' color:#C1C1B8; font-size: 30px; text-align: center; text-shadow: 1px 2px 1px grey; ' >&#2325;&#2379;&#2312; &#2346;&#2352;&#2367;&#2339;&#2366;&#2350; &#2344;&#2361;&#2368; &#2350;&#2367;&#2354;&#2366;</p>");	
  
%>

<%

if(request.getParameter("q")!=null)
{  int q =Integer.parseInt(request.getParameter("q"));


%>
<%

for(int iz=q+1;iz<q+10;iz++)
			    {   out.println("<br> <a href="+url[iz-1]+" style=' color:#FF0000; font-size: 18px; text-decoration:none;'>"+iz+") "+title[iz-1]+"<p style=\" color:#000080; font-size: 14px; \" >"+url[iz-1]+"</p></a>");
                    out.println("<font size='3' color='#C1C1B8'>"+uni[iz-1]+"</font><br><hr>");		 	               
                 
				 series_no++;		  
                  if(iz==t_length)				 
				  break;
		        }
}
%>

<script>
function showHint(str)
{
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txt").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","page.jsp?q="+str,true);
xmlhttp.send();
}
showHint(<%=0%>);
</script>

  <%  

  int iy=0;
  while(iy<t_length)
	{ %>

    <input id="txt1" type="button" value="<%=iy/10%>" onclick="showHint(<%=iy%>); " />
            
            <% 

     iy += 10 ; 			
	}

%>

<div  id="txt" ></div>
