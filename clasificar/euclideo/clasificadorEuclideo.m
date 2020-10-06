classdef clasificadorEuclideo
    %CLASIFICADOREUCLIDEO Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        databaseC1
        targetC1
        databaseC2
        targetC2
        patronesC1
        patronesC2
        
        z1
        z2
        Distance
    end
    
    methods
        function obj = clasificadorEuclideo(databaseC1,databaseC2,Distance)
            %CLASIFICADOREUCLIDEO Construct an instance of this class
            %   Detailed explanation goes here
            obj.databaseC1 = databaseC1(:,1:end-1);
            obj.databaseC2 = databaseC2(:,1:end-1);
            obj.targetC1 = databaseC1(:,end);
            obj.targetC2 = databaseC2(:,end);
            obj.patronesC1 =length(obj.targetC1);
            obj.patronesC2 =length(obj.targetC2);
            obj.Distance = Distance;
            obj.z1 = mean(obj.databaseC1);
            obj.z2 = mean(obj.databaseC2);                              
        end
        function [accuracy,precision,sensitivity] = predecir(obj,dbpredecirC1,dbpredecirC2)
            dbpredecir=[dbpredecirC1(:,1:end-1);dbpredecirC2(:,1:end-1)];
            numeroPatronesC1=length(dbpredecirC1(:,end));
            numeroPatronesC2=length(dbpredecirC2(:,end));
            D1=pdist2(dbpredecir,obj.z1,obj.Distance);
            D2=pdist2(dbpredecir,obj.z2,obj.Distance);
            distancia=D1<D2;
            %matriz confusion
            bienC1=sum(dbpredecirC1(:,end)==distancia(1:numeroPatronesC1));
            malC1=numeroPatronesC1-bienC1;
            bienC2=sum(dbpredecirC2(:,end)==distancia(numeroPatronesC1+1:end));
            malC2=numeroPatronesC2-bienC2;
            %metricas
            accuracy=(bienC1+bienC2)/(bienC1+malC1+bienC2+malC2);
            precision=(bienC1)/(bienC1+malC1);
            sensitivity=(bienC1)/(bienC1+malC2);
        end
    end
end

