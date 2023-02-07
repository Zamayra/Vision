function C = moravec2(I)
%MORAVEC Moravec corner detector
%
%   C = MORAVEC(I)
%
%   Thorsten.Hansen@psychol.uni-giessen.de  2015-05-20
%   Ignacio.Rocco@inria.fr                  2019-11-14
if nargin == 0 % simple test
  I = zeros(100);
  I(40:60, 40:60) = 1;
  C = moravec(I);
  imshow(0.5*C+I, [])
  if nargout == 0, clear C, end
  return
end
D(:,:,1) = conv2(conv2(single(I),[1 -1],'same').^2,ones(3),'same');
D(:,:,2) = conv2(conv2(single(I),[1;-1],'same').^2,ones(3),'same');
D(:,:,3) = conv2(conv2(single(I),[1 0;0 -1],'same').^2,ones(3),'same');
D(:,:,4) = conv2(conv2(single(I),[0 1;-1 0],'same').^2,ones(3),'same');
C = min(D.^2,[], 3);
if nargout == 0, clear C, end