//Carlos Rafael de Jesus Palma Costa  NMEC: 88755
//Diogo Costa Correia  NMEC: 90327

/************ Implementação do Dígrafo Dinâmico - digraph.c ************/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>

#include "digraph.h"	/* interface do dígrafo */
#include "queue.h"	/* interface da fila */

/************** Definição do Estrutura de Dados do Dígrafo *************/

typedef struct binode *PtBiNode;
typedef struct vertex *PtVertex;
typedef struct edge *PtEdge;

struct binode	/* definição de um binó genérico */
{
    unsigned int Number;	/* número do vértice ou da aresta */
    PtBiNode PtPrev;	/* ponteiro para o nó anterior da lista */
    PtBiNode PtNext;	/* ponteiro para o nó seguinte da lista */
    PtBiNode PtAdj;	/* ponteiro para a lista de adjacências */
    void *PtElem;	/* ponteiro para o elemento da lista */
    unsigned int Visit;	/* marcação de vértice visitado */
};

struct vertex	/* definição de um vértice */
{
    unsigned int InDeg;	/* semigrau incidente do vértice */
    unsigned int OutDeg;	/* semigrau emergente do vértice */
};

struct edge	/* definição de uma aresta */
{
    int Cost;	/* custo da aresta */
};

struct digraph	/* definição do dígrafo */
{
    PtBiNode Head;	/* ponteiro para a cabeça do dígrafo */
    unsigned int NVertexes;	/* número de vértices do dígrafo */
    unsigned int NEdges;	/* número de arestas do dígrafo */
    unsigned int Type;	/* tipo dígrafo (1)/grafo (0) */
};

/***************** Protótipos dos Subprogramas Internos ****************/

static PtVertex CreateVertex (void);
static PtEdge CreateEdge (int);
static PtBiNode CreateBiNode (unsigned int);
static void DestroyBiNode (PtBiNode *);
static PtBiNode InPosition (PtBiNode, unsigned int);
static PtBiNode OutPosition (PtBiNode, unsigned int);
static int InsertEdge (PtBiNode, PtBiNode, int);
static void DeleteEdge (PtBiNode, PtBiNode);

/********************** Definição dos Subprogramas *********************/

PtDigraph Create (unsigned int ptype)
{
    PtDigraph Digraph;

    if ((Digraph = (PtDigraph) malloc (sizeof (struct digraph))) == NULL)
        return NULL;	/* alocar memória para o dígrafo */
    Digraph->Head = NULL;	/* inicializa a cabeça do dígrafo */
    Digraph->NVertexes = 0;	/* inicializa o número de vértices */
    Digraph->NEdges = 0;	/* inicializa o número de arestas */
    Digraph->Type = ptype;	/* inicializa o tipo dígrafo/grafo */

    return Digraph;	/* devolve a referência do dígrafo criado */
}

int Destroy (PtDigraph *pdig)
{
    PtDigraph TmpDigraph = *pdig; PtBiNode Vertex, Edge;

    if (TmpDigraph == NULL) return NO_DIGRAPH;

    while (TmpDigraph->Head != NULL)	/* libertar a memória dos vértices */
    {
        Vertex = TmpDigraph->Head;	/* vértice da cabeça do dígrafo */
        TmpDigraph->Head = TmpDigraph->Head->PtNext;	/* atualizar cabeça */

        while (Vertex->PtAdj != NULL)	/* libertar a memória das arestas */
        {
            Edge = Vertex->PtAdj;	/* cabeça da lista das arestas */
            Vertex->PtAdj = Vertex->PtAdj->PtNext;	/* atualizar cabeça */
            free (Edge->PtElem);	/* libertar a memória da aresta */
            free (Edge);	/* libertar o binó da lista de arestas */
        }

        free (Vertex->PtElem);	/* libertar a memória do vértice */
        free (Vertex);	/* libertar o binó da lista de vértices */
    }

    free (TmpDigraph);	/* libertar a memória ocupada pelo dígrafo */
    *pdig = NULL;	/* colocar a referência do dígrafo a NULL */

    return OK;
}

PtDigraph Copy (PtDigraph pdig)
{
    PtDigraph Copy; PtBiNode Vert, PEdge; PtEdge Edge;

    if (pdig == NULL) return NULL;

    Copy = Create (pdig->Type);

    /* inserir os vértices */
    for (Vert = pdig->Head; Vert != NULL; Vert = Vert->PtNext)
        if (InVertex (Copy, Vert->Number)) { Destroy (&Copy); return NULL; }

    /* inserir as arestas */
    for (Vert = pdig->Head; Vert != NULL; Vert = Vert->PtNext)
        for (PEdge = Vert->PtAdj; PEdge != NULL; PEdge = PEdge->PtNext)
        {
            Edge = (PtEdge) PEdge->PtElem;
            if (InEdge (Copy, Vert->Number, PEdge->Number, Edge->Cost))
            { Destroy (&Copy); return NULL; }
        }

    return Copy;  /* devolver a referência do Digrafo criado */
}

int InVertex (PtDigraph pdig, unsigned int pv)
{
    PtBiNode Insert, Node;	/* posição de inserção e novo vértice */

    if (pdig == NULL) return NO_DIGRAPH;

    /* criar o binó e o vértice */
    if ((Node = CreateBiNode (pv)) == NULL) return NO_MEM;
    if ((Node->PtElem = CreateVertex ()) == NULL)
    { free (Node); return NO_MEM; }

    /* determinar posição de colocação e inserir o vértice */
    if (pdig->Head == NULL || pdig->Head->Number > pv)
    {				/* inserção à cabeça do dígrafo */
        Node->PtNext = pdig->Head; pdig->Head = Node;
        if (Node->PtNext != NULL) Node->PtNext->PtPrev = Node;
    }
    else
    {				/* inserção à frente do nó de inserção */
        if ((Insert = InPosition (pdig->Head, pv)) == NULL)
        {			/* inserção sem sucesso, porque o vértice já existe */
            DestroyBiNode (&Node); return REP_VERTEX;
        }
        Node->PtNext = Insert->PtNext;
        if (Node->PtNext != NULL) Node->PtNext->PtPrev = Node;
        Node->PtPrev = Insert; Insert->PtNext = Node;
    }

    pdig->NVertexes++;	/* atualizar o número de vértices */
    return OK;
}

int OutVertex (PtDigraph pdig, unsigned int pv)
{
    PtBiNode Vertex, Edge, Delete;	/* posição de remoção do vértice */

    if (pdig == NULL) return NO_DIGRAPH;
    if (pdig->NVertexes == 0) return DIGRAPH_EMPTY;

    /* determinar posição de remoção do vértice */
    if ((Delete = OutPosition (pdig->Head, pv)) == NULL)
        return NO_VERTEX;

    while (Delete->PtAdj != NULL)	/* remover a lista de adjacências */
    {	/* atualizar semigrau incidente da cabeça da lista das arestas */
        ((PtVertex) Delete->PtAdj->PtAdj->PtElem)->InDeg--;
        Edge = Delete->PtAdj;
        Delete->PtAdj = Delete->PtAdj->PtNext;	/* atualizar cabeça */
        DestroyBiNode (&Edge);	/* destruir binó com aresta */
        pdig->NEdges--;	/* atualizar o número de arestas */
    }
    /* remoção do vértice */
    if (Delete == pdig->Head)
    {				/* remoção do vértice da cabeça do dígrafo */
        if (Delete->PtNext != NULL) Delete->PtNext->PtPrev = NULL;
        pdig->Head = Delete->PtNext;
    }
    else
    {				/* remoção de outro vértice do dígrafo */
        Delete->PtPrev->PtNext = Delete->PtNext;
        if (Delete->PtNext != NULL) Delete->PtNext->PtPrev = Delete->PtPrev;
    }
    DestroyBiNode (&Delete);	/* destruir binó com vértice */
    pdig->NVertexes--;	/* atualizar o número de vértices */

    /* remover as arestas incidentes */
    Vertex = pdig->Head;	/* vértice da cabeça do dígrafo */
    while (Vertex != NULL)
    {				/* remover a aresta deste vértice para o vértice removido */
        if ((Edge = OutPosition (Vertex->PtAdj, pv)) != NULL)
        {
            if (Edge == Vertex->PtAdj)
            {		/* remoção da aresta da cabeça da lista das arestas */
                if (Edge->PtNext != NULL) Edge->PtNext->PtPrev = NULL;
                Vertex->PtAdj = Vertex->PtAdj->PtNext;
            }
            else
            {		/* remoção de outra aresta da lista das arestas */
                Edge->PtPrev->PtNext = Edge->PtNext;
                if (Edge->PtNext != NULL) Edge->PtNext->PtPrev = Edge->PtPrev;
            }
            ((PtVertex) Vertex->PtElem)->OutDeg--;	/* atualizar semigrau */
            DestroyBiNode (&Edge);	/* destruir binó com aresta */
            if (pdig->Type) pdig->NEdges--;	/* atualizar o número de arestas */
        }
        Vertex = Vertex->PtNext;	/* vértice seguinte do dígrafo */
    }
    return OK;
}

int InEdge (PtDigraph pdig, unsigned int pv1, unsigned int pv2, int pcost)
{
    PtBiNode V1, V2;	/* posição dos vértices adjacentes */

    if (pdig == NULL) return NO_DIGRAPH;
    if (pdig->NVertexes == 0) return NO_VERTEX;	/* sem vértices */
    if (pv1 == pv2) return REP_EDGE;	/* lacetes proibidos */

    /* verificar se os vértices existem e se a aresta já existe */
    if ((V1 = OutPosition (pdig->Head, pv1)) == NULL)
        return NO_VERTEX;	/* vértice emergente inexistente */
    if (V1->PtAdj != NULL && OutPosition (V1->PtAdj, pv2) != NULL)
        return REP_EDGE;	/* aresta existente */
    if ((V2 = OutPosition (pdig->Head, pv2)) == NULL)
        return NO_VERTEX;	/* vértice incidente inexistente */

    /* inserir a aresta v1-v2 */
    if (InsertEdge (V1, V2, pcost) != OK) return NO_MEM;
    if (!pdig->Type)	/* se é grafo, inserir também a aresta v2-v1 */
        if (InsertEdge (V2, V1, pcost) != OK)
        {		/* se a aresta v2-v1 não foi inserida, remover a aresta v1-v2 */
            DeleteEdge (V1, V2); return NO_MEM;
        }

    pdig->NEdges++;	/* incrementar o número de arestas */
    return OK;
}

int OutEdge (PtDigraph pdig, unsigned int pv1, unsigned int pv2)
{
    PtBiNode V1, V2;	/* posição dos vértices adjacentes */

    if (pdig == NULL) return NO_DIGRAPH;
    if (pdig->NVertexes == 0) return NO_VERTEX;
    if (pdig->NEdges == 0 || pv1 == pv2) return NO_EDGE;

    /* verificar se os vértices e a aresta existem */
    if ((V1 = OutPosition (pdig->Head, pv1)) == NULL)
        return NO_VERTEX;	/* vértice emergente inexistente */
    if (V1->PtAdj == NULL || OutPosition (V1->PtAdj, pv2) == NULL)
        return NO_EDGE;	/* aresta inexistente */
    if ((V2 = OutPosition (pdig->Head, pv2)) == NULL)
        return NO_VERTEX;	/* vértice incidente inexistente */


    DeleteEdge (V1, V2);	/* remover a aresta v1-v2 */
    /* se é grafo, remover também a aresta v2-v1 */
    if (!pdig->Type) DeleteEdge (V2, V1);

    pdig->NEdges--;	/* decrementar o número de arestas */
    return OK;
}

int Type (PtDigraph pdig, unsigned int *pty)
{
    if (pdig == NULL) return NO_DIGRAPH;
    if (pty == NULL) return NULL_PTR;

    *pty = pdig->Type;
    return OK;
}

int VertexNumber (PtDigraph pdig, unsigned int *pnv)
{
    if (pdig == NULL) return NO_DIGRAPH;
    if (pnv == NULL) return NULL_PTR;

    *pnv = pdig->NVertexes;
    return OK;
}

int EdgeNumber (PtDigraph pdig, unsigned int *pne)
{
    if (pdig == NULL) return NO_DIGRAPH;
    if (pne == NULL) return NULL_PTR;

    *pne = pdig->NEdges;
    return OK;
}

int GetVertexList (PtDigraph pdig, unsigned int ppos, char *pvlist)
{
    PtBiNode PVert, PEdge; PtEdge Edge; char NodeList[20];

    if (pdig == NULL) return NO_DIGRAPH;
    if (ppos > pdig->NVertexes) return NO_VERTEX;
    if (pvlist == NULL) return NULL_PTR;

    ppos--;
    for (PVert = pdig->Head; ppos > 0; ppos--) PVert = PVert->PtNext;

    sprintf (NodeList, "Vertice %2d > ", PVert->Number);
    strcpy (pvlist, NodeList);

    for (PEdge = PVert->PtAdj; PEdge != NULL; PEdge = PEdge->PtNext)
    {
        sprintf (NodeList, "%2d (", PEdge->Number);
        strcat (pvlist, NodeList);
        Edge = (PtEdge) PEdge->PtElem;
        sprintf (NodeList, "%2d) ", Edge->Cost);
        strcat (pvlist, NodeList);
    }

    return OK;
}

PtDigraph CreateFile (char *pfilename)
{
    PtDigraph Digraph; FILE *PtF;
    unsigned int Type, NVertexes, NEdges, V, E, Vert1, Vert2; int Status, Cost;

    /* abertura com validação do ficheiro para leitura */
    if ( (PtF = fopen (pfilename, "r")) == NULL) return NULL;

    /* leitura do tipo de digrafo/grafo e criação do vazio */
    fscanf (PtF, "%d", &Type); fscanf (PtF, "%*c");

    /* leitura do número de vértices e de arestas do ficheiro e criação do digrafo vazio */
    fscanf (PtF, "%d %d", &NVertexes, &NEdges); fscanf (PtF, "%*c");

    if ((Digraph = Create (Type)) == NULL) { fclose (PtF); return NULL; }

    /* leitura dos vértices do ficheiro */
    for (V = 0; V < NVertexes ; V++)
    {
        fscanf (PtF, "%d", &Vert1); fscanf (PtF, "%*c");
        if (InVertex (Digraph, Vert1))
        { Destroy (&Digraph); fclose (PtF); return NULL; }
    }

    /* leitura das arestas do ficheiro */
    for (E = 0; E < NEdges ; E++)
    {
        Status = fscanf (PtF, "%d %d %d", &Vert1, &Vert2, &Cost); fscanf (PtF, "%*c");
        if (Status != 3)
        { Destroy (&Digraph); fclose (PtF); return NULL; }

        if (InEdge (Digraph, Vert1, Vert2, Cost))
        { Destroy (&Digraph); fclose (PtF); return NULL; }
    }

    fclose (PtF);  /* fecho do ficheiro */

    return Digraph;  /* devolve o digrafo criado */
}

int StoreFile (PtDigraph pdig, char *pfilename)
{
    FILE *PtF; PtBiNode Vert, PEdge; PtEdge Edge;

    if (pdig == NULL) return NO_DIGRAPH;

    /* abertura com validação do ficheiro para escrita */
    if ((PtF = fopen (pfilename, "w")) == NULL) return NO_FILE;

    /* escrita do tipo do digrafo no ficheiro */
    fprintf (PtF, "%u\n", pdig->Type);

    /* escrita do número de vértices e de arestas do digrafo no ficheiro */
    fprintf (PtF, "%u\t%u\n", pdig->NVertexes, pdig->NEdges);

    /* escrita dos vértices do digrafo no ficheiro */
    for (Vert = pdig->Head; Vert != NULL; Vert = Vert->PtNext)
        fprintf (PtF, "%u\n", Vert->Number);

    /* escrita das arestas do digrafo no ficheiro */
    for (Vert = pdig->Head; Vert != NULL; Vert = Vert->PtNext)
        for (PEdge = Vert->PtAdj; PEdge != NULL; PEdge = PEdge->PtNext)
        {
            Edge = (PtEdge) PEdge->PtElem;
            fprintf (PtF, "%u\t%u\t%d\n", Vert->Number, PEdge->Number, Edge->Cost);
        }

    fclose (PtF);  /* fecho do ficheiro */

    return OK;
}

PtDigraph DigraphComplement (PtDigraph pdig)
{
    PtDigraph Comp; PtBiNode Vert1, Vert2; int Erro;

    if (pdig == NULL) return NULL;
    if ((Comp = Copy (pdig)) == NULL) return NULL;

    for (Vert1 = pdig->Head; Vert1 != NULL; Vert1 = Vert1->PtNext)
        for (Vert2 = pdig->Head; Vert2 != NULL; Vert2 = Vert2->PtNext)
        {
            if (Vert2 == Vert1) continue;

            Erro = InEdge (Comp, Vert1->Number, Vert2->Number, 1);

            if (Erro == REP_EDGE)
            {
                Erro = OutEdge (Comp, Vert1->Number, Vert2->Number);
                if (Erro != OK) { Destroy (&Comp); return NULL; }
            }
            else if (Erro != OK) { Destroy (&Comp); return NULL; }
        }

    return Comp;  /* devolver a referência do Digrafo criado */
}

int VertexType (PtDigraph pdig, unsigned int pv)
{
    /* Insira o seu código - Insert your code */
    if(pdig == NULL) return NO_DIGRAPH;
    if(pdig -> NVertexes == 0) return DIGRAPH_EMPTY;
    if(pv > pdig -> NVertexes) return NO_VERTEX;

    PtVertex vertex = OutPosition(pdig -> Head, pv) -> PtElem;

    if(vertex -> InDeg == 0){
        if(vertex -> OutDeg == 0)
            return DISC;
        return SOURCE;
    }
    if(vertex -> OutDeg == 0)
        return SINK;

    return OK;

}

int VertexClassification (PtDigraph pdig, unsigned int pv, double *pclass)
{
    /* Insira o seu código - Insert your code */
    if(pdig == NULL) return NO_DIGRAPH;
    if(pdig -> NVertexes == 0) return DIGRAPH_EMPTY;
    if(pv > pdig -> NVertexes) return NO_VERTEX;
    if(pclass == NULL) return NULL_PTR;

    PtVertex vertex = OutPosition(pdig -> Head, pv) -> PtElem;
    *pclass = (double)(vertex -> OutDeg + vertex -> InDeg) / ((pdig -> NVertexes - 1) * 2);

    return OK;
}

PtDigraph DigraphTranspose (PtDigraph pdig)
{
    /* Insira o seu código - Insert your code */
    PtDigraph Trans; PtBiNode Vert, PEdge; PtEdge Edge;

    if (pdig == NULL) return NULL;

    Trans = Create (pdig->Type);

    /* inserir os vértices */
    for (Vert = pdig->Head; Vert != NULL; Vert = Vert->PtNext)
        if (InVertex (Trans, Vert->Number)) { Destroy (&Trans); return NULL; }

    /* inserir as arestas */
    for (Vert = pdig->Head; Vert != NULL; Vert = Vert->PtNext)
        for (PEdge = Vert->PtAdj; PEdge != NULL; PEdge = PEdge->PtNext)
        {
            Edge = (PtEdge) PEdge->PtElem;
            if (InEdge (Trans, PEdge->Number, Vert->Number, Edge->Cost))
            { Destroy (&Trans); return NULL; }
        }

    return Trans;  /* devolver a referência do Digrafo criado */
}

int DigraphEdgeSplit (PtDigraph pdig, unsigned int pve, unsigned int pvi)
{
    /* Insira o seu código - Insert your code */
    if (pdig == NULL)
        return NO_DIGRAPH;

    if (pdig -> Head == NULL)
        return DIGRAPH_EMPTY;

    PtBiNode node, v1Node, edgeNode;
    PtEdge edge;
    int cost, index;

    if((v1Node = OutPosition(pdig -> Head, pve)) == NULL){
        return NO_EDGE;
    }

    else if ((edgeNode = OutPosition(v1Node -> PtAdj, pvi)) == NULL) {
        return NO_EDGE;
    }

    edge = ((PtEdge) edgeNode -> PtElem);
    cost = edge -> Cost;
    node = pdig -> Head;
    while(node -> PtNext != NULL){
        node = node -> PtNext;
    }
    index = node -> Number + 1;
    if (InVertex(pdig, index) == NO_MEM)
        return NO_MEM;
    if (InEdge(pdig, v1Node -> Number, index, (cost/2)) == NO_MEM)
        return NO_MEM;
    if (InEdge(pdig, index, pvi, ((cost+1)/2)) == NO_MEM)
        return NO_MEM;
    OutEdge(pdig, pve, pvi);
    return OK;
}

int DigraphVertexSplit (PtDigraph pdig, unsigned int pv)
{
    /* Insira o seu código - Insert your code */
    PtBiNode aux, vertex;
    int Index1, Index2, ErrorCode;

    if (pdig == NULL) return NO_DIGRAPH;
    if (pdig -> NVertexes == 0) return DIGRAPH_EMPTY;
    if ((vertex = OutPosition(pdig -> Head, pv)) == NULL) return NO_VERTEX;
    //Inserção do primeiro vértice
    for (aux = pdig -> Head; aux -> PtNext != NULL; aux = aux -> PtNext);
    Index1 = aux -> Number + 1;
    if ((ErrorCode = InVertex(pdig, Index1)) != OK) return ErrorCode;

    for (aux = pdig -> Head; aux != NULL; aux = aux -> PtNext) {
        if (aux -> Number != pv) {
            for (PtBiNode Adj = aux -> PtAdj; Adj != NULL; Adj = Adj -> PtNext) {
                if (Adj -> Number == pv) {
                    if ((ErrorCode= InEdge(pdig, aux -> Number, Index1, ((PtEdge) (Adj -> PtElem)) -> Cost)) != OK) {
                        OutVertex(pdig, Index1);
                        return ErrorCode;
                    }
                }
            }
        }
    }

    //Inserção do segundo vértice
    for (aux = pdig -> Head; aux -> PtNext != NULL; aux = aux -> PtNext);
    Index2 = aux -> Number + 1;
    if ((ErrorCode = InVertex(pdig, Index2)) != OK) return ErrorCode;

    for (aux = vertex -> PtAdj; aux != NULL; aux = aux -> PtNext) {
        if ((ErrorCode= InEdge(pdig, Index2, aux -> Number, ((PtEdge) (aux -> PtElem)) -> Cost)) != OK) {
            OutVertex(pdig, Index2);
            OutVertex(pdig, Index2 + 1);
            return ErrorCode;
        }
    }

    if ((ErrorCode = InEdge(pdig, Index1, Index2, 0)) != OK) {
        OutVertex(pdig, Index1);
        OutVertex(pdig, Index2);
        return ErrorCode;
    }

    if((ErrorCode=OutVertex(pdig, pv) != OK)) {
        OutVertex(pdig, Index1);
        OutVertex(pdig, Index2);
        return ErrorCode;
    }
    return OK;
}

int AllSuccDist (PtDigraph pdig, unsigned int pv, double pdst, PtQueue *pqueue)
{
    /* Insira o seu código - Insert your code */
    if(pdig == NULL) return NO_DIGRAPH;
    if(pdig -> NVertexes == 0) return DIGRAPH_EMPTY;
    if(pv > pdig -> NVertexes) return NO_VERTEX;
    if(pqueue == NULL) return NULL_PTR;

    PtQueue queue;
    PtBiNode Aux, currentNode;
    PtEdge edge;

    if((queue = QueueCreate(sizeof(unsigned int))) == NULL){
        return NO_MEM;
    }

    for (Aux = pdig -> Head; Aux -> PtNext != NULL; Aux = Aux -> PtNext) {
        // encontrado o node do pv
        if (Aux -> Number == pv) {
            // percorre os PtAdj do Aux
            int nVert;
            for (nVert = 1; nVert < pdig -> NVertexes+1; nVert++) {

                // se existir um vértice que vai do pv a nVert
                if ((currentNode = OutPosition(Aux -> PtAdj, nVert)) != NULL) {
                    edge = (PtEdge) currentNode -> PtElem;

                    // se o custo da aresta for menor que o custo predefinido
                    if (edge -> Cost < pdst) {
                        if (QueueEnqueue(queue, &nVert) == NO_MEM)
                            return NO_MEM;
                    }
                }
            }
        }
    }

    *pqueue = queue;

    return OK;
}

int AllInEdgesVertex (PtDigraph pdig, unsigned int pv, PtQueue *pqueue)
{
    /* Insira o seu código - Insert your code */
    if (pdig == NULL) return NO_DIGRAPH;
    if (pdig -> NVertexes == 0) return DIGRAPH_EMPTY;
    if (pv > pdig -> NVertexes) return NO_VERTEX;
    if (pqueue == NULL) return NULL_PTR;

    PtQueue queue;
    if ((queue = QueueCreate(sizeof(unsigned int))) == NULL) {
        return NO_MEM;
    }

    *pqueue = queue;

    if (((PtVertex)(OutPosition(pdig -> Head, pv) -> PtElem)) -> InDeg == 0) return OK;

    for (PtBiNode vertex = pdig -> Head; vertex != NULL; vertex = vertex -> PtNext) {
        for (PtBiNode aux = vertex->PtAdj; aux != NULL; aux = aux -> PtNext) {
            int number;
            if (number == ((PtVertex)(OutPosition(pdig -> Head, pv) -> PtElem)) -> InDeg) return OK;
            if (aux -> Number == pv) {
                if (QueueEnqueue(queue, &vertex -> Number) != OK) return NO_MEM;
                if (QueueEnqueue(queue, &pv) != OK) return NO_MEM;
                number++;
            }
        }
    }

    return OK;
}

/***************** Definição dos Subprogramas Internos *****************/

/* Função que insere, de facto, uma aresta no dígrafo/grafo. Em caso de sucesso devolve OK, senão devolve NO_MEM para assinalar falta de memória. */

static int InsertEdge (PtBiNode pv1, PtBiNode pv2, int pcost)
{
    PtBiNode Insert, Node;	/* posição de inserção e nova aresta */

    /* criar o binó e a aresta */
    if ((Node = CreateBiNode (pv2->Number)) == NULL) return NO_MEM;
    if ((Node->PtElem = CreateEdge (pcost)) == NULL)
    { free (Node); return NO_MEM; }

    /* determinar posição de colocação e inserir a aresta */
    if (pv1->PtAdj == NULL || pv1->PtAdj->Number > pv2->Number)
    {				/* inserção à cabeça da lista das arestas */
        Node->PtNext = pv1->PtAdj; pv1->PtAdj = Node;
        if (Node->PtNext != NULL) Node->PtNext->PtPrev = Node;
    }
    else
    {				/* inserção à frente do nó de inserção */
        Insert = InPosition (pv1->PtAdj, pv2->Number);
        Node->PtNext = Insert->PtNext;
        if (Node->PtNext != NULL) Node->PtNext->PtPrev = Node;
        Node->PtPrev = Insert; Insert->PtNext = Node;
    }

    Node->PtAdj = pv2;	/* ligar o vértice 1 ao vértice 2 */
    /* incrementar semigraus dos vértices emergente do 1 e incidente do 2 */
    ((PtVertex) pv1->PtElem)->OutDeg++;
    ((PtVertex) pv2->PtElem)->InDeg++;

    return OK;
}

/* Função que remove, de facto, uma aresta do dígrafo/grafo. */

static void DeleteEdge (PtBiNode pv1, PtBiNode pv2)
{
    PtBiNode Delete;	/* posição de remoção da aresta */

    /* determinar posição de remoção da aresta */
    Delete = OutPosition (pv1->PtAdj, pv2->Number);

    if (Delete == pv1->PtAdj)	/* remoção da aresta */
    {				/* remoção da aresta da cabeça da lista das arestas */
        if (Delete->PtNext != NULL) Delete->PtNext->PtPrev = NULL;
        pv1->PtAdj = Delete->PtNext;
    }
    else
    {				/* remoção de outra aresta do vértice */
        Delete->PtPrev->PtNext = Delete->PtNext;
        if (Delete->PtNext != NULL) Delete->PtNext->PtPrev = Delete->PtPrev;
    }

    DestroyBiNode (&Delete);	/* destruir binó com aresta */

    /* decrementar semigraus dos vértices emergente do 1 e incidente do 2 */
    ((PtVertex) pv1->PtElem)->OutDeg--;
    ((PtVertex) pv2->PtElem)->InDeg--;
}

/* Função que cria o vértice do dígrafo/grafo. Devolve a referência do vértice criado ou NULL, caso não consiga criá-lo por falta de memória. */

static PtVertex CreateVertex (void)
{
    PtVertex Vertex;

    if ((Vertex = (PtVertex) malloc (sizeof (struct vertex))) == NULL)
        return NULL;

    Vertex->InDeg = 0;	/* inicializa o semigrau incidente */
    Vertex->OutDeg = 0;	/* inicializa o semigrau emergente */
    return Vertex;	/* devolve o vértice criado */
}

/* Função que cria a aresta do dígrafo/grafo. Devolve a referência da aresta criada ou NULL, caso não consiga criá-la por falta de memória. */

static PtEdge CreateEdge (int pcost)
{
    PtEdge Edge;

    if ((Edge = (PtEdge) malloc (sizeof (struct edge))) == NULL)
        return NULL;

    Edge->Cost = pcost;	/* armazena o custo da aresta */
    return Edge;	/* devolve a aresta criada */
}

/* Função que cria o binó da lista de vértices ou da lista de arestas. Devolve a referência do binó criado ou NULL, caso não consiga criá-lo por falta de memória. */

static PtBiNode CreateBiNode (unsigned int pnumber)
{
    PtBiNode Node;

    if ((Node = (PtBiNode) malloc (sizeof (struct binode))) == NULL)
        return NULL;

    Node->PtNext = NULL;	/* binó aponta para a frente para NULL */
    Node->PtPrev = NULL;	/* binó aponta para a trás para NULL */
    Node->PtAdj = NULL;	/* lista de adjacências nula */
    Node->Number = pnumber;	/* armazena o identificador do binó */
    return Node;	/* devolve o binó criado */
}

/* Função que liberta a memória ocupada pelo binó e pelo seu elemento. */

static void DestroyBiNode (PtBiNode *pbinode)
{
    if (*pbinode == NULL) return;

    free ((*pbinode)->PtElem);
    free (*pbinode);
    *pbinode = NULL;
}

/* Função de pesquisa para inserção. Devolve um ponteiro para o binó à frente do qual deve ser feita a inserção do novo vértice (nova aresta) ou NULL, caso o vértice (a aresta) já exista. */

static PtBiNode InPosition (PtBiNode phead, unsigned int pnumber)
{
    PtBiNode Node, Prev;

    for (Node = phead; Node != NULL; Node = Node->PtNext)
    {
        if (Node->Number >= pnumber) break;
        Prev = Node;
    }

    if (Node == NULL || Node->Number > pnumber) return Prev;
    else return NULL;	/* o elemento já existe */
}

/* Função de pesquisa para remoção. Devolve um ponteiro para o binó onde se encontra o vértice (a aresta) ou NULL, caso o vértice (a aresta) não exista. */

static PtBiNode OutPosition (PtBiNode phead, unsigned int pnumber)
{
    PtBiNode Node;

    for (Node = phead; Node != NULL; Node = Node->PtNext)
        if (Node->Number == pnumber) break;
    return Node;
}
