function [ g p particles ] = pso( nb_particles, iterations )
%PSO Summary of this function goes here
%   Detailed explanation goes here
particles = [randi(10,nb_particles,1) randi(5,nb_particles,1)]

p = particles;

particlesWeight = zeros(nb_particles, 3);

for i=1:nb_particles
    particlesWeight(i,:) = [particles(i,:) weight(particles(i,:))];
end

particlesSortedWeight = sortrows(particlesWeight,-3); 
g = particlesSortedWeight(1,1:2);
omega = 1;
phi_p = 1;
phi_g = 1;

velocities= [(randi(20,nb_particles,1)-10) (randi(10,nb_particles,1)-5)];

for k=1:iterations
    fprintf('Iteration %d \n___________\n',k)
    for i=1:nb_particles
        r_p = rand(1);					
        r_g = rand(1);					
        velocities(i,1)	= omega*velocities(i,1)+phi_p*r_p*(p(i,1)-particles(i,1))+phi_g*r_g*(g(1,1)-particles(i,1));
        velocities(i,2)	= omega*velocities(i,2)+phi_p*r_p*(p(i,2)-particles(i,2))+phi_g*r_g*(g(1,2)-particles(i,2));
        particles(i,:) = round(particles(i,:) + velocities(i,:));

        fprintf('Particle %d : (%d,%d) \n',i,particles(i,1),particles(i,2))
        
        if weight(particles(i,:))< weight(p(i,:))
                p(i,:) = particles(i,:);
                fprintf('New Personal Best for %d: (%d,%d) with weight=%d \n',i,p(i,1),p(i,2),weight(p(i,:)))
            if weight(particles(i,:))< weight(g)
                g = particles(i,1:2);
                fprintf('New Global Best (%d,%d) with f(g)=%d \n',g(1),g(2),weight(g))
            end
        end
    end
end
