#include <hls_stream.h>
#include <ap_axi_sdata.h>

#include <cstdint>

extern "C" {
    void output_kernel(uint32_t* c, hls::stream<ap_axiu<32, 0, 0, 0>>& input_stream)
    {
        #pragma HLS INTERFACE m_axi port=c offset=slave bundle=gmem
        #pragma HLS INTERFACE axis port=input_stream
        ap_axiu<32, 0, 0, 0> res = input_stream.read();
        *c = res.data;
    }
}
