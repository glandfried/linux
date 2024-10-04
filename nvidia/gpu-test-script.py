import torch
import time

def test_gpu():
    print("Checking CUDA availability...")
    if torch.cuda.is_available():
        print("CUDA is available. GPU detected:")
        print(f"Device name: {torch.cuda.get_device_name(0)}")
        
        # Simple GPU operation
        x = torch.rand(5000, 5000).cuda()
        start_time = time.time()
        result = torch.matmul(x, x)
        end_time = time.time()
        
        print(f"Matrix multiplication time: {end_time - start_time:.4f} seconds")
    else:
        print("CUDA is not available. GPU is not being used.")

if __name__ == "__main__":
    test_gpu()
