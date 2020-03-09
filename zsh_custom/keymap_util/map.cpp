#include <cstdio>
#include <cstdlib>
#include <cstring>

using namespace std;

int main()
{
    const long long ref = 0x700000000;
    char path[200];
    strcat(path, getenv("ZSH_CUSTOM"));
    FILE *config = fopen(strcat(path, "/keymap_util/map.config"), "r");

    long long src, dst;
    printf("{\"UserKeyMapping\":[");
    bool first = 1;
    while (fscanf(config, "%llx %llx", &src, &dst) > 0)
    {
        if (src == 0 && dst == 0) return 0;
        // modify values
        src |= ref;
        dst |= ref;
        // output
        if (first) first = false;
        else printf(",");
        printf("{\"HIDKeyboardModifierMappingSrc\":0x%llx,\"HIDKeyboardModifierMappingDst\":0x%llx}", src, dst);
    }
    printf("]}");

    return 0;
}
