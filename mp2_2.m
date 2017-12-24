fileID = fopen('input_network.txt','r');
formatSpec = '%f';
Input = fscanf(fileID,formatSpec); % Input about relevant info read % 
fclose(fileID);

N = Input(1); % get number of nodes *
Packet_size = Input(2) * 8; % get the packet size in bits % 
T = Input(3) * 10^-3; % get simulation time in s %
Backoff_St = Input(4); % get the random backoff strategy %

if Backoff_St == 1
% Strategy 1 %
    total_time = 0;
    count = 0;
    good_time = 0;
    data_rate = 6 * 10^6; % 6 Mbps %
    packet_time = Packet_size / data_rate; % get packet time %
    slot_size = 9 * (10^-6); % 9 us %
    j = 1;
    simulation_count = 0;
    CW_min = 15;
    CW = 15;
    collision_flag = 0;
    r = (randi([0,CW_min],N,1)) * 10^-6; % generate N random numbers and put them into an array %
   
    while total_time < T
        
        [M,I] = min(r); % find the node with the minimum counter and index of node %
        simulation_count = simulation_count + 1;
        
        for i = 1:N   % check if there are more than one nodes with same minimum counter %
            if (M == r(i))
                count = count + 1;
                collision_index(j) = i;
                j = j + 1;
            end
        end
        
        if count > 1
            collision_flag = 1; % collision occured %
        end
        
        if collision_flag ~= 1 % if no collision, increase good time %
            good_time = good_time + packet_time;
            CW = CW_min;
            r(I) = (randi([0,CW],1,1)) * 10^-6;
        else
            CW = CW * 2;
            for i = 1:N
                if (M == r(i)) % for all nodes that collided, choose new rand %
                    r(i) = (randi([0,CW],1,1)) * 10^-6;
                end
            end
        end
        
        total_time = total_time + packet_time;
        
        for i = 1:N
            for j = 1:size(collision_index)
                if(i ~= collision_index(j))
                    r(i) = r(i) - slot_size;
                end
            end
        end
        count = 0;
        collision_flag = 0;
    end
    
    utility = good_time / total_time;
end

if Backoff_St == 2
  % Strategy 2 %
    total_time = 0;
    count = 0;
    good_time = 0;
    data_rate = 6 * 10^6; % 6 Mbps %
    packet_time = Packet_size / data_rate; % get packet time %
    slot_size = 9 * (10^-6); % 9 us %
    j = 1;
    simulation_count = 0;
    CW_min = 15;
    CW = 15;
    collision_flag = 0;
    r = (randi([0,CW_min],N,1)) * 10^-6; % generate N random numbers and put them into an array %
   
    while total_time < T
        
        [M,I] = min(r); % find the node with the minimum counter and index of node %
        simulation_count = simulation_count + 1;
        
        for i = 1:N   % check if there are more than one nodes with same minimum counter %
            if (M == r(i))
                count = count + 1;
                collision_index(j) = i;
                j = j + 1;
            end
        end
        
        if count > 1
            collision_flag = 1; % collision occured %
        end
        
        if collision_flag ~= 1
            good_time = good_time + packet_time;
            CW = round(CW,2);
            r(I) = (randi([0,CW],1,1)) * 10^-6;
        else
            CW = CW + 2;
            for i = 1:N
                if (M == r(i))
                    r(i) = (randi([0,CW],1,1)) * 10^-6;
                end
            end
        end
        
        total_time = total_time + packet_time;
        for i = 1:N
            for j = 1:size(collision_index)
                if(i ~= collision_index(j))
                    r(i) = r(i) - slot_size;
                end
            end
        end
        count = 0;
        collision_flag = 0;
    end
    
    utility = good_time / total_time;
end


if Backoff_St == 3
   % Strategy 3 %
    total_time = 0;
    count = 0;
    good_time = 0;
    data_rate = 6 * 10^6; % 6 Mbps %
    packet_time = Packet_size / data_rate; % get packet time %
    slot_size = 9 * (10^-6); % 9 us %
    j = 1;
    simulation_count = 0;
    CW_min = 15;
    CW = 15;
    collision_flag = 0;
    r = (randi([0,CW_min],N,1)) * 10^-6; % generate N random numbers and put them into an array %
   
    while total_time < T
        
        [M,I] = min(r); % find the node with the minimum counter and index of node %
        simulation_count = simulation_count + 1;
        
        for i = 1:N   % check if there are more than one nodes with same minimum counter %
            if (M == r(i))
                count = count + 1;
                collision_index(j) = i;
                j = j + 1;
            end
        end
        
        if count > 1
            collision_flag = 1; % collision occured %
        end
        
        if collision_flag ~= 1
            good_time = good_time + packet_time;
            CW = round(CW,2);
            r(I) = (randi([0,CW],1,1)) * 10^-6;
        else
            CW = CW * 2;
            for i = 1:N
                if (M == r(i))
                    r(i) = (randi([0,CW],1,1)) * 10^-6;
                end
            end
        end
        
        total_time = total_time + packet_time;
        for i = 1:N
            for j = 1:size(collision_index)
                if(i ~= collision_index(j))
                    r(i) = r(i) - slot_size;
                end
            end
        end
        count = 0;
        collision_flag = 0;
    end
    
    utility = good_time / total_time;
end

if Backoff_St == 4
% Strategy 4 %
    total_time = 0;
    count = 0;
    good_time = 0;
    data_rate = 6 * 10^6; % 6 Mbps %
    packet_time = Packet_size / data_rate; % get packet time %
    slot_size = 9 * (10^-6); % 9 us %
    j = 1;
    simulation_count = 0;
    CW_min = 15;
    CW = 15;
    collision_flag = 0;
    r = (randi([0,CW_min],N,1)) * 10^-6; % generate N random numbers and put them into an array %
   
    while total_time < T
        
        [M,I] = min(r); % find the node with the minimum counter and index of node %
        simulation_count = simulation_count + 1;
        
        for i = 1:N   % check if there are more than one nodes with same minimum counter %
            if (M == r(i))
                count = count + 1;
                collision_index(j) = i;
                j = j + 1;
            end
        end
        
        if count > 1
            collision_flag = 1; % collision occured %
        end
        
        if collision_flag ~= 1
            good_time = good_time + packet_time;
            CW = CW - 2;
            if CW < 1
                CW = 2;
            end
            r(I) = (randi([0,CW],1,1)) * 10^-6;
        else
            CW = CW + 2;
            for i = 1:N
                if (M == r(i))
                    r(i) = (randi([0,CW],1,1)) * 10^-6;
                end
            end
        end
        
        total_time = total_time + packet_time;
        for i = 1:N
            for j = 1:size(collision_index)
                if(i ~= collision_index(j))
                    r(i) = r(i) - slot_size;
                end
            end
        end
        count = 0;
        collision_flag = 0;
    end
    
    utility = good_time / total_time;
end

if Backoff_St == 5
    % strategy 5 %
    total_time = 0;
    count = 0;
    good_time = 0;
    data_rate = 6 * 10^6; % 6 Mbps %
    packet_time = Packet_size / data_rate; % get packet time %
    slot_size = 9 * (10^-6); % 9 us %
    j = 1;
    simulation_count = 0;
    CW_min = 15;
    CW = 15;
    collision_flag = 0;
    r = (randi([0,CW_min],N,1)) * 10^-6; % generate N random numbers and put them into an array %
   
    while total_time < T
        
        [M,I] = min(r); % find the node with the minimum counter and index of node %
        simulation_count = simulation_count + 1;
        
        for i = 1:N   % check if there are more than one nodes with same minimum counter %
            if (M == r(i))
                count = count + 1;
                collision_index(j) = i;
                j = j + 1;
            end
        end
        
        if count > 1
            collision_flag = 1; % collision occured %
        end
        
        if collision_flag ~= 1
            good_time = good_time + packet_time;
            CW = CW - 2;
            if CW < 1
                CW = 2;
            end
            r(I) = (randi([0,CW],1,1)) * 10^-6;
        else
            CW = CW * 2;
            for i = 1:N
                if (M == r(i))
                    r(i) = (randi([0,CW],1,1)) * 10^-6;
                end
            end
        end
        
        total_time = total_time + packet_time;
        for i = 1:N
            for j = 1:size(collision_index)
                if(i ~= collision_index(j))
                    r(i) = r(i) - slot_size;
                end
            end
        end
        count = 0;
        collision_flag = 0;
    end
    
    utility = good_time / total_time;
end


fprintf('Number of Nodes: %d ; Packet Size: %d ; Simulation Time(s): %d ; Backoff Strategy: %d \n Utilization: ', N, Input(2), T, Backoff_St);
disp(utility);

