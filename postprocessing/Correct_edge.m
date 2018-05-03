im_edgenew(1:250,95)=0;

im_edgenew(250,1:151)=1;
im_edgenew(1:250,136)=0;

im_edgenew(1:250,100)=0;
im_edgenew(1:250,151)=0;
im_edgenew(250,136)=1;
im_edgenew(250,100)=1;

im_edgenew(1:30,100)=1;
im_edgenew(31:60,99)=1;
im_edgenew(61:90,98)=1;
im_edgenew(91:120,97)=1;
im_edgenew(121:150,96)=1;
im_edgenew(151:180,95)=1;
im_edgenew(181:210,94)=1;
im_edgenew(211:240,93)=1;
im_edgenew(241:250,92)=1;

im_edgenew(1:30,151)=1;
im_edgenew(31:60,150)=1;
im_edgenew(61:90,149)=1;
im_edgenew(91:120,148)=1;
im_edgenew(121:150,147)=1;
im_edgenew(151:180,146)=1;
im_edgenew(181:210,145)=1;
im_edgenew(211:240,144)=1;
im_edgenew(241:250,144)=1;


im_edgenew(1:10,247)=1;
im_edgenew(11:13,248)=1;
im_edgenew(14:17,249)=1;
im_edgenew(18:20,250)=1;
im_edgenew(21:23,251)=1;
im_edgenew(24:26,252)=1;
im_edgenew(27:28,253)=1;
im_edgenew(29:30,254)=1;
im_edgenew(31:34,255)=1;
im_edgenew(35:38,256)=1;
im_edgenew(39:40,257)=1;
im_edgenew(41:50,258)=1;
im_edgenew(51:54,258)=1;
im_edgenew(55:58,259)=1;
im_edgenew(59:60,260)=1;
im_edgenew(51:60,261)=1;
im_edgenew(61:70,265)=1;
im_edgenew(71:80,268)=1;
im_edgenew(81:90,271)=1;
im_edgenew(91:100,273)=1;
im_edgenew(101:110,275)=1;
im_edgenew(111:120,277)=1;
im_edgenew(121:130,279)=1;
im_edgenew(131:140,280)=1;
im_edgenew(141:160,282)=1;
im_edgenew(161:165,284)=1;
im_edgenew(166:170,286)=1;
im_edgenew(171:175,288)=1;
im_edgenew(176:180,289)=1;
im_edgenew(181:190,290)=1;
im_edgenew(191:195,295)=1;
im_edgenew(196:200,297)=1;

figure;imshow(im_edgenew);
figure; imagesc(Disp_out_GT); axis equal; colorbar;