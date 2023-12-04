
B = input('Enter the edges of the graph: ');
numNodes = input('Enter the number of vertices:');

adjMatrix = zeros(numNodes);

for i = 1:size(B, 1)
    adjMatrix(B(i, 1), B(i, 2)) = 1;
    adjMatrix(B(i, 2), B(i, 1)) = 1;
end

disp(adjMatrix)

A = adjMatrix;

degree = sum(A);

D = zeros(size(A));
T = zeros(size(A));
H = zeros(size(A));
M = zeros(size(A));
R = zeros(size(A));
F = zeros(size(A));
S = zeros(size(A));
I = zeros(size(A));
AZ = zeros(size(A));
RA = zeros(size(A));
IR = zeros(size(A));
HZ = zeros(size(A));
ABC = zeros(size(A));
SC = zeros(size(A));

for i = 1:size(A,1)
    for j = i+1:size(A,2)
        if A(i,j) == 1
            D(i,j) = degree(i) + degree(j);
            T(i,j) = degree(i) * degree(j);
            H(i,j) = 2/D(i,j);
            H(j,i) = H(i,j);
            M(i,j) = 1/(degree(i) * degree(j));
            R(i,j) = T(i,j)*D(i,j);
            F(i,j) = degree(i)^2 + degree(j)^2;
            S(i,j) = F(i,j)/ T(i,j);
            I(i,j) = T(i,j)/ D(i,j);
            AZ(i,j) = (T(i,j)/ (D(i,j)-2))^3;
            RA(i,j) = T(i,j)^(-1/2);
            IR(i,j) = 1/RA(i,j);
            HZ(i,j) = D(i,j)^2;
            ABC(i,j) = ((D(i,j)-2)/T(i,j))^(1/2);
            SC(i,j) = 1/(D(i,j))^(1/2);
        end
    end
end


result1 = 1;
Zagreb1 = 0;
result2 = 1;
Zagreb2 = 0;
ENTH = 1;
Harmonic = 0;
ENTmod = 1;
modifiedzagrab = 0;
result3 = 1;
RefZ = 0;
% ENTF = 1;
ENTF = 0;
Forgotten =0;
SDD =0;
ENTSDD = 1;
Inverse = 0;
ENTI = 1;
Augment = 0;
ENTA = 1;
Randic = 0;
ENTR = 1;
InRandic = 0;
ENTIR = 1;
ENTHZ = 1;
HZagreb = 0;
ENTABC = 1;
Atombond = 0;
ENTSC = 1;
Sumconnect = 0;

for i = 1:size(A,1)
    for j = i+1:size(A,2)
        if A(i,j) == 1
            result1 = result1 * (D(i,j)^D(i,j));
            Zagreb1 = Zagreb1 + D(i,j);
            result2 = result2 * (T(i,j)^T(i,j));
            Zagreb2 = Zagreb2 + T(i,j);
            ENTH = ENTH * (H(i,j)^H(i,j));
            Harmonic = Harmonic + H(i,j);
            modifiedzagrab = modifiedzagrab + M(i,j);
            ENTmod = ENTmod * (M(i,j)^ M(i,j));
            result3 = result3 + (R(i,j)* log10(R(i,j)));
            RefZ = RefZ + R(i,j);
            %ENTF = ENTF * (F(i,j)^ F(i,j));
ENTF = ENTF + (F(i,j)* log10(F(i,j)));
            Forgotten = Forgotten + F(i,j);
            ENTSDD = ENTSDD * (S(i,j)^ S(i,j));
            SDD = SDD + S(i,j);
            ENTI = ENTI * (I(i,j)^ I(i,j));
            Inverse = Inverse + I(i,j);
            ENTA = ENTA * (AZ(i,j)^ AZ(i,j));
            Augment = Augment + AZ(i,j);
            ENTR = ENTR * (RA(i,j)^ RA(i,j));
            Randic = Randic + RA(i,j);
            ENTIR = ENTIR * (IR(i,j)^ IR(i,j));
            InRandic = InRandic + IR(i,j);
            ENTHZ = ENTHZ + (HZ(i,j) ^ HZ(i,j));
            HZagreb = HZagreb + HZ(i,j);
            ENTABC = ENTABC * (ABC(i,j)^ ABC(i,j));
            Atombond = Atombond + ABC(i,j);
            ENTSC = ENTSC * (SC(i,j)^ SC(i,j));
            Sumconnect = Sumconnect + SC(i,j);

        end
    end
end

inv_Zagreb1 = 1/Zagreb1;
inv_Zagreb2 = 1/Zagreb2;
inv_Harmonic = 1/Harmonic;
inv_modifiedzagrab = 1/modifiedzagrab;
inv_RefZ = 1/RefZ;
inv_Forgotten = 1/Forgotten;
inv_SDD = 1/SDD;
inv_Inverse = 1/Inverse;
inv_Augment = 1/Augment;
inv_Randic = 1/Randic;
inv_InRandic = 1/InRandic;
inv_HZagreb = 1/HZagreb;
inv_Atombond = 1/Atombond;
inv_Sumconnect = 1/Sumconnect;

result1 = log10(result1);
result2 = log10(result2);
ENTH = log10(ENTH);
ENTmod = log10(ENTmod);
result3 = log10(result3);
ENTF = log10(ENTF);
ENTSDD = log10(ENTSDD);
ENTI = log10(ENTI);
ENTA = log10(ENTA);
ENTR = log10(ENTR);
ENTIR = log10(ENTIR);
ENTHZ = log10(ENTHZ);
ENTABC = log10(ENTABC);
ENTSC = log10(ENTSC);

result1 = log10(Zagreb1)- (inv_Zagreb1 * result1);
result2 = log10(Zagreb2)- (inv_Zagreb2 * result2);
ENTH = log10(Harmonic)- (inv_Harmonic * ENTH);
ENTmod = log10(modifiedzagrab)- (inv_modifiedzagrab * ENTmod);
result3 = log10(RefZ)- (inv_RefZ * result3);
ENTF = log10(Forgotten)- (inv_Forgotten * ENTF);
ENTSDD = log10(SDD)- (inv_SDD * ENTSDD);
ENTI = log10(Inverse)- (inv_Inverse * ENTI);
ENTA = log10(Augment)- (inv_Augment * ENTA);
ENTR = log10(Randic)- (inv_Randic * ENTR);
ENTIR = log10(InRandic)- (inv_InRandic * ENTIR);
ENTHZ = log10(HZagreb)- (inv_HZagreb * ENTHZ);
ENTABC = log10(Atombond)- (inv_Atombond * ENTABC);
ENTSC = log10(Sumconnect)- (inv_Sumconnect * ENTSC);


disp(['The first Zagreb index is:', num2str(Zagreb1)]);
disp(['The entropy first Zagreb index is:', num2str(result1)]);
disp(['The second Zagreb index is:', num2str(Zagreb2)]);
disp(['The entropy second Zagreb index is: ', num2str(result2)]);
disp(['The Hyper Zagreb index is:', num2str(HZagreb)]);
disp(['The entropy Hyper Zagreb index is:', num2str(ENTHZ)]);
disp(['The H-index is:', num2str(Harmonic)]);
disp(['The entropy H-index is:', num2str(ENTH)]);
disp(['The modified Zagreb index is:', num2str(modifiedzagrab)]);
disp(['The entropy modified Zagreb index is:', num2str(ENTmod)]);
disp(['The Refined third Zagreb index is:', num2str(RefZ)]);
disp(['The entropy Refined third Zagreb index is: ', num2str(result3)]);
disp(['The F-index is:', num2str(Forgotten)]);
disp(['The entropy F-index is: ', num2str(ENTF)]);
disp(['The SDD index is: ', num2str(SDD)]);
disp(['The entropy SDD index is: ', num2str(ENTSDD)]);
disp(['The Inverse sum indeg index is: ', num2str(Inverse)]);
disp(['The entropy Inverse sum indeg index is: ', num2str(ENTI)]);
disp(['The Augment Zagreb index is: ', num2str(Augment)]);
disp(['The entropy Augment Zagreb index is: ', num2str(ENTA)]);
disp(['The Randic index is: ', num2str(Randic)]);
disp(['The entropy Randic index is: ', num2str(ENTR)]);
disp(['The Inverse Randic index is: ', num2str(InRandic)]);
disp(['The entropy Inverse Randic index is: ', num2str(ENTIR)]);
disp(['The Atom bond connectivity index is: ', num2str(Atombond)]);
disp(['The entropy Atom bond connectivity index is: ', num2str(ENTABC)]);
disp(['The Sum connectivity index is: ', num2str(Sumconnect)]);
disp(['The entropy Sum connectivity index is: ', num2str(ENTSC)]);